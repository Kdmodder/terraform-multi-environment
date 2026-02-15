# 🚀 Terraform Multi-Environment AWS Infrastructure

This project provisions a complete **multi-environment infrastructure (Dev, Staging, Production)** on AWS using **Terraform modules** and best Infrastructure as Code (IaC) practices.

---

## 📌 Architecture Overview
<img width="1201" height="677" alt="image" src="https://github.com/user-attachments/assets/677c673b-8023-4e92-83e1-80379dd871a8" />


The infrastructure is structured using reusable Terraform modules and supports:

- ✅ Dev Environment
- ✅ Staging Environment
- ✅ Production Environment

Each environment provisions:

- EC2 Instances
- S3 Buckets
- DynamoDB Tables
- Security Groups
- VPC (where applicable)
- Remote Backend with S3 + DynamoDB (state locking)

---

## 🏗 Environment Configuration

| Environment | Instance Type | Instances |
|-------------|---------------|-----------|
| Dev         | t3.micro      | 1         |
| Staging     | t3.micro      | 1         |
| Production  | t3.small      | 2         |

---

## 📦 Resources Created

### 🖥 EC2
- Environment-specific instances
- Tagged using `Environment = dev/stg/prd`

### 🪣 S3 Buckets
- dev-infra-app-bucket
- stg-infra-app-bucket
- prd-infra-app-bucket

### 🗄 DynamoDB
- Application tables per environment
- Remote backend state locking table

### 🔐 Remote Backend
- Terraform state stored in S3
- State locking using DynamoDB
- Prevents concurrent state corruption

---

## 📁 Project Structure

