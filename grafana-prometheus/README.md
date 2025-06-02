# Grafana + Prometheus Monitoring Project

This project sets up Grafana and Prometheus using Docker Compose to monitor a web and database application on an EC2 instance. You’ll collect metrics from your apps and visualize them in Grafana dashboards.

---

## Prerequisites: Run Prometheus & Grafana with Docker Compose

Ensure you have Docker and Docker Compose installed. Then use the following setup:

### docker-compose.yml

```yaml
version: '3'

services:
  prometheus:
    image: prom/prometheus
    container_name: prometheus
    ports:
      - "9091:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml

  grafana:
    image: grafana/grafana
    container_name: grafana
    ports:
      - "3000:3000"
    depends_on:
      - prometheus
```

### prometheus.yml

Configure Prometheus to scrape targets (e.g., your EC2 instance):

```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'ec2-app'
    static_configs:
      - targets: ['<your-ec2-ip>:9100']
```

Replace `<your-ec2-ip>` with the public IP of your EC2 instance after you will have created the EC2 instance using the steps below.

---

# Grafana + Prometheus Monitoring with EC2 Example

This guide walks you through setting up **Grafana + Prometheus** to monitor a real-world application infrastructure on AWS EC2. You'll deploy a **Node.js web application** and **MongoDB** database, monitor system metrics with Prometheus, and visualize data with Grafana.

---

## Real-World Use Case

You’re running a small e-commerce backend on an EC2 instance:
- **Web Application**: Node.js API server (e.g. Express.js)
- **Database**: MongoDB
- **Goal**: Monitor EC2 system metrics and visualize CPU, memory, disk I/O, and MongoDB performance

---

## Architecture Overview

```
[ EC2 Instance ]
├── Node.js Web App
├── MongoDB
└── Node Exporter (Prometheus exporter)

[ Prometheus Container (Local or Remote) ]
└── Scrapes metrics from EC2:9100 (Node Exporter)

[ Grafana Container ]
└── Visualizes metrics from Prometheus
```

---

## Step-by-Step Setup

### 1. Launch an EC2 Instance

Use the Terraform or AWS CLI script in `ec2-setup/` directory to launch a monitored EC2 instance.

Ensure the following ports are open in the EC2 Security Group:
- `9100` (Node Exporter)
- `3000` (Grafana, optional if hosting there)

---

### 2. SSH into EC2 and Install Components

```bash
ssh -i monitoring-key.pem ec2-user@<EC2_PUBLIC_IP>
```

Install Docker:
```bash
sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
```

Install Node Exporter:
```bash
sudo useradd -rs /bin/false node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar xvfz node_exporter-*.tar.gz
cd node_exporter-1.7.0.linux-amd64/
sudo cp node_exporter /usr/local/bin
```

Run Node Exporter:
```bash
sudo nohup node_exporter &
```

Install MongoDB and Node.js App (sample):
```bash
sudo docker run -d --name mongo -p 27017:27017 mongo
sudo docker run -d --name webapp -p 8080:8080 your-nodejs-image
```

---

### 3. Configure Prometheus to Scrape EC2

In your Prometheus config (`prometheus.yml`), add your EC2 public IP:

```yaml
scrape_configs:
  - job_name: 'ec2-node-exporter'
    static_configs:
      - targets: ['<EC2_PUBLIC_IP>:9100']
```

Then restart Prometheus:
```bash
docker compose down && docker compose up -d
```

---

### 4. Add Prometheus as Data Source in Grafana

1. Visit `http://localhost:3000` (Grafana)
2. Default credentials: `admin / admin`
3. Go to **Settings → Data Sources**
4. Select **Prometheus**
5. URL: `http://prometheus:9090`
6. Click **Save & Test**

---

### 5. Create Dashboard in Grafana

- Import premade dashboards for Node Exporter: `1860`
- Optionally, create a custom dashboard for:
  - EC2 CPU Usage
  - MongoDB Container Uptime
  - Web App Response Rate (using blackbox exporter or custom metrics)

---

## Cleanup

### Stop EC2 Monitoring App
```bash
sudo docker stop webapp mongo
sudo pkill node_exporter
```

### Remove EC2 (locally)
```bash
terraform destroy -auto-approve
```

---

## Summary

You now have:
- EC2 running Node.js + MongoDB
- Prometheus scraping metrics from EC2 (via Node Exporter)
- Grafana visualizing the EC2 app and infra health

This setup mimics what many DevOps/SRE teams use for lightweight observability without full-blown APM tools.

---

**Author:** Emmanuel Naweji
---

## Installing Prometheus and Grafana Locally (Optional)

If you prefer running Prometheus and Grafana directly on your local machine without Docker:

### Install Prometheus

#### macOS (using Homebrew)
```bash
brew install prometheus
prometheus --version
```

#### Linux
```bash
wget https://github.com/prometheus/prometheus/releases/download/v2.51.1/prometheus-2.51.1.linux-amd64.tar.gz
tar xvf prometheus-*.tar.gz
cd prometheus-*
./prometheus --config.file=prometheus.yml
```

Prometheus runs by default on: [http://localhost:9090](http://localhost:9090)

---

### Install Grafana

#### macOS (using Homebrew)
```bash
brew install grafana
brew services start grafana
```

#### Linux
```bash
sudo apt-get install -y apt-transport-https software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt-get update
sudo apt-get install grafana
sudo systemctl enable --now grafana-server
```

Grafana runs by default on: [http://localhost:3000](http://localhost:3000)

---

After installation, repeat the same steps for configuring Prometheus as a data source and importing dashboards.
---

## 🔄 After Installing Grafana Locally

Once Grafana is installed and running, follow these steps to configure Prometheus as a data source and import dashboards:

### 1. Access Grafana
Open your browser and go to: [http://localhost:3000](http://localhost:3000)

**Default Credentials**:
- Username: `admin`
- Password: `admin`

---

### 2. Add Prometheus as a Data Source
- Go to the sidebar → ⚙️ **(Configuration)** → **Data Sources**
- Click **Add data source**
- Choose **Prometheus**
- Set URL to:
  - `http://prometheus:9090` (if using Docker network)
  - or `http://localhost:9091` (if Prometheus is running locally)
- Click **Save & Test**

---

### 3. Import a Dashboard
- Navigate to **Dashboards** → **Import**
- Enter a Dashboard ID (e.g., `1860` for Node Exporter dashboard)
- Click **Load**
- Select your Prometheus data source
- Click **Import**

Grafana is now ready to visualize Prometheus metrics from your EC2 apps and infrastructure.

---

## Author: Emmanuel Naweji

![AWS Certified](https://img.shields.io/badge/AWS-Certified-blue?logo=amazonaws)
![Azure Solutions Architect](https://img.shields.io/badge/Azure-Solutions%20Architect-0078D4?logo=microsoftazure)
![CKA](https://img.shields.io/badge/Kubernetes-CKA-blue?logo=kubernetes)
![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform)
![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-blue?logo=githubactions)
![GitLab CI](https://img.shields.io/badge/CI/CD-GitLab%20CI-FC6D26?logo=gitlab)
![Jenkins](https://img.shields.io/badge/CI/CD-Jenkins-D24939?logo=jenkins)
![Ansible](https://img.shields.io/badge/Automation-Ansible-red?logo=ansible)
![ArgoCD](https://img.shields.io/badge/GitOps-ArgoCD-orange?logo=argo)
![VMware](https://img.shields.io/badge/Virtualization-VMware-607078?logo=vmware)
![Linux](https://img.shields.io/badge/OS-Linux-black?logo=linux)
![FinOps](https://img.shields.io/badge/FinOps-Cost%20Optimization-green?logo=money)
![OpenAI](https://img.shields.io/badge/AI-OpenAI-ff9900?logo=openai)
