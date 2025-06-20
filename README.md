# ⚙️ Data Ingestion Pipeline with AWS, Docker, NiFi, Jupyter, and Snowflake

This repository documents a real-time data ingestion pipeline using Dockerized services on AWS EC2, with integration to Snowflake via Amazon S3 and Snowpipe.

---

## 🧱 Architecture Overview

- **Amazon EC2 (Linux)**: Hosts Docker containers using `docker-compose.yml`.
- **Dockerized Services**:
  - **Apache NiFi** – Used to move and transform data.
  - **Jupyter Lab** – Used to generate fake/test data.
  - **Zookeeper** – Optional, included for future extensions (e.g., Kafka).
- **Amazon S3** – Stores data files uploaded by NiFi.
- **Snowflake Snowpipe** – Automatically ingests data from S3 into staging tables.
- **Snowflake Streams & Tasks** – Track changes and populate final target tables.

---

## 🔄 Workflow

1. Launch EC2 instance and run `docker-compose up`.
2. Access services via EC2 public IP and mapped ports:
   - Jupyter Lab: `http://<EC2_IP>:<jupyter_port>`
   - Apache NiFi: `http://<EC2_IP>:<nifi_port>`
3. Use **Jupyter Lab** to generate fake datasets using Python.
4. **Apache NiFi** picks up the data and uploads it to a defined **S3 bucket**.
5. **Snowpipe** detects new files in S3 and loads them into the **Snowflake staging table**.
6. **Snowflake Stream** captures new data.
7. **Snowflake Task** runs ELT logic to update **Target Table 1** and **Target Table 2**.

---

## 🚀 Technologies Used

- Docker + Docker Compose
- Apache NiFi
- Jupyter Lab
- AWS EC2, IAM, & S3
- Snowflake (Snowpipe, Streams, Tasks)

---

## 📌 Notes

- Ensure proper IAM roles are configured for Snowpipe to read from S3.
- Port mappings for Jupyter and NiFi must be defined in `docker-compose.yml`.
- Example libraries for fake data: `Faker`, `pandas`, `numpy`.

---
