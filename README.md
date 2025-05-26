# Observability Docker Projects

This repository provides simple, containerized observability stacks using Docker Compose. Each folder contains an isolated project with basic monitoring or logging functionality to help you get hands-on experience.

## Tools Covered

- **Prometheus** – Metrics collection and alerting
- **Grafana** – Dashboards and visualization for Prometheus
- **Datadog** – Monitoring Docker containers via Datadog Agent
- **Dynatrace** – Observability using Dynatrace OneAgent
- **New Relic** – Instrumentation of a Node.js app
- **ELK Stack** – Centralized log aggregation using Elasticsearch, Logstash, and Kibana

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
