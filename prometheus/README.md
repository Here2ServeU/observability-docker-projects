# Prometheus Monitoring

This project sets up Prometheus and Node Exporter using Docker Compose.

## Instructions

1. Run the stack:

```bash
docker-compose up -d
```

2. Access Prometheus: [http://localhost:9090](http://localhost:9090)

3. Prometheus scrapes metrics from Node Exporter on port `9100`.
