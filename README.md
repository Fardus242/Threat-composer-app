# AWS Threat Modelling App Deployed to AWS ECS with Terraform and Github Actions

This project builds upon Amazon's open-source Threat Composer Tool, extending it into a production-ready deployment on AWS. It showcases a containerised Node.js application hosted on ECS Fargate, with infrastructure as code managed via Terraform and automated CI/CD pipelines using GitHub Actions.

## Overview
- Automated infrastructure provisioning
- CI/CD pipeline for seamless deployments
- Dockerised application running on AWS ECS
- HTTPS access enabled through an Application Load Balancer and ACM
- DNS management via Route 53

## Architecture Diagram:


## Local app setup 💻

```bash
yarn install
yarn build
yarn global add serve
serve -s build

#Then visit:
http://localhost:3000/workspaces/default/dashboard

## Or use:
yarn global add serve
serve -s build
```

## Key Components
* ### Docker

* Dockerfile defines how the Node.js app is containerized.

Terraform (Infrastructure as Code)

ECS Fargate to host the containerized app.

Application Load Balancer for HTTPS traffic routing.

Route 53 for DNS/domain management.

ACM (AWS Certificate Manager) for SSL/TLS certificates.

Security groups to manage network access.

VPC setup with public subnets, internet gateway, and NAT gateway.

S3 Bucket for remote Terraform state with state locking.

CI/CD (GitHub Actions)

Build and scan Docker images.

Push images to Amazon ECR.

Run Terraform plan and apply for infrastructure changes.

Optionally destroy infrastructure if needed.
