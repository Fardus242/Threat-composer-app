# AWS Threat Modelling App Deployed to AWS ECS with Terraform and Github Actions

This project builds upon Amazon's open-source Threat Composer Tool, extending it into a production-ready deployment on AWS. It showcases a containerised Node.js application hosted on ECS Fargate, with infrastructure as code managed via Terraform and automated CI/CD pipelines using GitHub Actions.

## Overview
- Automated infrastructure provisioning
- CI/CD pipeline for seamless deployments
- Dockerised application running on AWS ECS
- HTTPS access enabled through an Application Load Balancer and ACM
- DNS management via Route 53

## Architecture Diagram:
![Untitled Diagram](https://github.com/user-attachments/assets/15e00d98-b40a-4044-9382-7fd2ea35030b)



## Local app setup 💻

```bash
yarn install
yarn build
yarn global add serve
serve -s build

Then visit:
http://localhost:3000/workspaces/default/dashboard

Or use:
yarn global add serve
serve -s build
```

## Project Structure
```
./
├── app/
├── Dockerfile
├── terraform/
│   ├── backend.tf
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── modules/
│       ├── acm/
│       ├── alb/
│       ├── ecs/
│       ├── route53/
│       └── vpc/
└── .github/
    └── workflows/
        ├── apply.yml
        ├── destroy.yml
        ├── docker.yml
        └── plan.yml

```


## Key Components
### Docker
- `Dockerfile` in the `app/` directory defines how the application is built into a container.

### Terraform (Infrastructure as Code)
- **ECS Fargate** – hosts the application container.
- **Application Load Balancer (ALB)** – routes traffic to your ECS service.
- **Route 53** – manages the domain.
- **ACM (AWS Certificate Manager)** – provides SSL certificates.
- **Security Groups** – control inbound and outbound access.
- **VPC** – includes public subnets, an Internet Gateway, and a NAT Gateway.
- **Remote State** – stored in an S3 bucket with state locking for safety.

### CI/CD (GitHub Actions)
- **Docker workflows** – build and scan Docker images.
- **ECR workflows** – push images to Amazon ECR.
- **Terraform workflows** – run `plan`, `apply`, and optionally `destroy` infrastructure.

### Deployment Workflow

1. **Docker Build and Push**
   - Builds the Docker image.
   - Runs a security scan using Trivy.
   - Pushes the image to Amazon ECR.

2. **Terraform Plan**
   - Initializes the Terraform configuration (`terraform init`) and generates an execution plan (`terraform plan`).
   - Validates configuration with TFLint.
   - Performs a security scan using Checkov.

3. **Terraform Apply**
   - Applies the Terraform configuration to create or update infrastructure.
   - Deploys the ECS service, Application Load Balancer, Route 53 records, and ACM certificate.

4. **Terraform Destroy**
   - Tears down all Terraform-managed resources when they are no longer needed.


### Here is a demonstration

### Domain Page

<img width="1900" height="958" alt="Screenshot 2025-09-04 145659" src="https://github.com/user-attachments/assets/b38d1957-35d5-48b3-b17d-2e37f712e85c" />

### SSL certificate
<img width="1908" height="921" alt="Screenshot 2025-09-04 145619" src="https://github.com/user-attachments/assets/ef0478df-0860-4546-a80c-b4a22c1d033a" />

### Docker Build and Push to ECR
<img width="1896" height="747" alt="image" src="https://github.com/user-attachments/assets/6ec4356a-940c-4f0d-af9e-765120ef155c" />

### Terraform Plan

<img width="1908" height="846" alt="image" src="https://github.com/user-attachments/assets/345d0723-7044-4c60-87da-b7c3e7ea56bb" />

### Terraform Apply
<img width="1862" height="668" alt="image" src="https://github.com/user-attachments/assets/3fb2e9a9-1e77-4ca7-b21c-c80ebd55714e" />

### Terraform Destroy 
<img width="1886" height="697" alt="image" src="https://github.com/user-attachments/assets/e9387ecc-ff7f-432f-9cc0-1027081cd221" />



