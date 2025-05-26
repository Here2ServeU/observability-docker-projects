# ELK Stack (Elasticsearch, Logstash, Kibana)

This project sets up ELK for centralized logging.

## Instructions

1. Run the ELK stack:

```bash
docker-compose up -d
```

2. Logstash listens on port `5000` for logs.

3. Access Kibana: [http://localhost:5601](http://localhost:5601)

4. Sample log source: send JSON logs over TCP to port `5000`.
