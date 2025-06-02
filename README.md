# Observability Docker Projects

This repository provides simple, containerized observability stacks using Docker Compose. Each folder contains an isolated project with basic monitoring or logging functionality to help you get hands-on experience.

## Tools Covered

- **Prometheus** – Metrics collection and alerting
- **Grafana** – Dashboards and visualization for Prometheus
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


### ELK Stack (Elasticsearch, Logstash, Kibana)
- **Use For**: Centralized log aggregation, searching, and analytics.
- **Pros**: Open-source, flexible query & dashboarding.
- **Cons**: Heavy resource usage, complex scaling.
- **Use When**: You want a custom, self-hosted logging pipeline.


---

## Prerequisites
# How to Install Docker & Docker Compose (macOS/Linux)

### Step 1: Install Docker

#### macOS (Recommended: Docker Desktop)
1. Download from: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
2. Install and follow GUI instructions
3. Verify installation:
   ```bash
   docker --version
   ```

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
```
Then verify:
```bash
docker --version
```

### Step 2: Install Docker Compose

#### Option A: Use `docker compose` (v2 Plugin — Recommended)
Already included with Docker Desktop (v20.10+).

Test it:
```bash
docker compose version
```

Use it like:
```bash
docker compose up -d
```

#### Option B: Install Legacy `docker-compose` (Standalone Binary)

##### 1. **Find your architecture**
```bash
uname -m
```

- `x86_64` → Intel
- `arm64` → Apple Silicon (M1/M2/M3)

##### 2. **Install Binary**
##### For **Intel macOS**:
```bash
curl -L https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-darwin-x86_64 -o ~/bin/docker-compose
chmod +x ~/bin/docker-compose
```

###### For **Apple Silicon (M1/M2/M3)**:
```bash
curl -L https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-darwin-aarch64 -o ~/bin/docker-compose
chmod +x ~/bin/docker-compose
```

##### 3. **Update PATH**
Add to `~/.zshrc` or `~/.bashrc`:
```bash
export PATH="$HOME/bin:$PATH"
```
Then reload:
```bash
source ~/.zshrc
```

##### 4. **Verify Installation**
```bash
docker-compose --version
```

###  Step 1: Install Docker on Windows

#### Recommended: Docker Desktop for Windows
1. Download Docker Desktop: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
2. Requirements:
   - Windows 10/11 64-bit: Pro, Enterprise, or Education
   - WSL 2 enabled (for Windows Home edition)
3. Follow the installer steps and restart your system.

#### Verify Installation
Open PowerShell or CMD:
```powershell
docker --version
docker compose version
```

### Step 2: Use Docker Compose

#### `docker compose` (v2 Plugin - Recommended)
Included with Docker Desktop. Just use:
```powershell
docker compose up -d
```

#### Legacy `docker-compose` (Optional, Not Recommended on Windows)
If needed for older projects:
1. Download from [https://github.com/docker/compose/releases](https://github.com/docker/compose/releases)
2. Add the executable to a directory listed in your system `PATH`

#### Notes for Windows Users
- Prefer **PowerShell** or **Windows Terminal with WSL2** for CLI work.
- Enable **WSL2 backend** in Docker Desktop settings for better Linux compatibility.


##### Done!
You can now use Docker and Docker Compose to run containers and orchestrate multi-container apps.


---

## Folder Structure

```
observability-docker-projects/
├── prometheus/
├── grafana/
├── datadog/
├── dynatrace/
├── newrelic/
└── elk/
```

Each subdirectory includes:
- `docker-compose.yml` file
- Any required configuration (e.g., Prometheus config, Logstash pipeline)
- A `README.md` with setup steps

## Getting Started

To run a project:

```bash
cd <tool-name>
docker-compose up -d
```

Example:

```bash
cd prometheus
docker-compose up -d
```

## Notes

- You may need API keys or credentials for **Datadog**, **Dynatrace**, or **New Relic**.
- For **Grafana**, configure your **Prometheus** data source manually via the web UI.
- These projects are for **local testing and learning** only.

---

Happy Monitoring!


---
By Emmanuel Naweji

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
