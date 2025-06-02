# Observability Docker Projects

A collection of simple, containerized observability stacks using Docker Compose. Each folder contains an isolated setup to help you experiment with monitoring and logging tools in local environments.

---

## Tools Covered

- **Prometheus** – Metrics collection and alerting
- **Grafana** – Dashboards and visualization for Prometheus and others
- **Datadog** – Monitoring Docker containers via Datadog Agent
- **Dynatrace** – Observability using Dynatrace OneAgent
- **New Relic** – Instrumentation of a Node.js app
- **ELK Stack** – Centralized log aggregation using Elasticsearch, Logstash, and Kibana

---

## Tool Trade-Offs and When to Use

### Prometheus
- **Use For**: Metrics collection, alerting, and monitoring of cloud-native apps.
- **Pros**: Lightweight, flexible, excellent Kubernetes integration.
- **Cons**: Limited long-term storage, lacks native dashboards.
- **Use When**: You want a fast, open-source, and scalable metric solution.

### Grafana
- **Use For**: Building custom dashboards for metrics and logs.
- **Pros**: Powerful visualizations, supports many data sources.
- **Cons**: Requires external storage backends.
- **Use When**: You need a unified dashboard for multi-source observability.

### Datadog
- **Use For**: Full-stack SaaS observability—infra, logs, APM, synthetics.
- **Pros**: Easy to set up, rich UI, excellent integrations.
- **Cons**: Costly at scale, vendor lock-in.
- **Use When**: You want instant visibility without managing infrastructure.

### Dynatrace
- **Use For**: AI-powered monitoring with automatic root-cause detection.
- **Pros**: Deep application insights, auto-discovery, Smartscape topology.
- **Cons**: Enterprise pricing, steeper learning curve.
- **Use When**: You run critical enterprise systems needing intelligent alerting.

### New Relic
- **Use For**: App performance monitoring, logs, infrastructure.
- **Pros**: Developer-friendly, unified UI for all telemetry.
- **Cons**: Usage-based pricing, some features gated by plan.
- **Use When**: You want cloud-native observability with minimal config.

### ELK Stack
- **Use For**: Centralized log aggregation, searching, and analytics.
- **Pros**: Open-source, flexible query & dashboarding.
- **Cons**: Heavy resource usage, complex scaling.
- **Use When**: You want a custom, self-hosted logging pipeline.

---

## Prerequisites – Installing Docker & Docker Compose

### macOS (Docker Desktop)
```bash
brew install --cask docker
open /Applications/Docker.app
docker --version
```

### Ubuntu/Debian Linux
```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version
```

### Docker Compose (Plugin)
```bash
docker compose version
docker compose up -d
```

### Docker Compose (Legacy Binary)

#### Intel macOS
```bash
curl -L https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-darwin-x86_64 -o ~/bin/docker-compose
chmod +x ~/bin/docker-compose
```

#### Apple Silicon
```bash
curl -L https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-darwin-aarch64 -o ~/bin/docker-compose
chmod +x ~/bin/docker-compose
```

#### Add to PATH
```bash
export PATH="$HOME/bin:$PATH"
source ~/.zshrc
docker-compose --version
```

### Windows
- Download Docker Desktop: https://www.docker.com/products/docker-desktop
- Requirements: WSL2, Windows 10+ (Pro or Home)
- After install:
```powershell
docker --version
docker compose version
```

---

## Folder Structure

```
observability-docker-projects/
├── prometheus/
├── grafana/
├── datadog/
├── dynatrace/
├── newrelic/
├── elk/
└── ec2-setup/
```

Each folder contains:
- `docker-compose.yml`
- Tool-specific configs (e.g., `prometheus.yml`, `logstash.conf`)
- A `README.md` with usage instructions

---

## Getting Started

```bash
cd <tool-name>
docker compose up -d
```

Example:
```bash
cd prometheus
docker compose up -d
```

---

## EC2 Setup for Cloud Testing

Included in the `ec2-setup/` folder:
- `main.tf` – Terraform config to provision an EC2 instance
- `aws-cli-setup.sh` – AWS CLI script to generate key and launch instance
- `ssh-access.txt` – SSH access instructions
- `cleanup.sh` – Scripts to tear down instance and remove local keys

---

## Cleanup Instructions

### Stop and Remove Docker Containers
```bash
docker compose down
```

### Remove All Volumes (Optional – removes stored data)
```bash
docker compose down -v
```

### Prune All Docker Images (Optional)
```bash
docker image prune -a
```

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
