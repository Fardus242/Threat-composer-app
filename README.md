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

1. ### Docker

  *Dockerfile in the app/ directory defines how the application is built into a container.

2. ### Terraform (Infrastructure as Code)

 *ECS Fargate – hosts the application container.

 *Application Load Balancer (ALB) – routes traffic to your ECS service.

 *Route 53 – manages the domain.

 *ACM (AWS Certificate Manager) – provides SSL certificates.

 *Security Groups – control inbound and outbound access.

 *VPC – includes public subnets, an Internet Gateway, and a NAT Gateway.

 *Remote State – stored in an S3 bucket with state locking for safety.

3. ### CI/CD (GitHub Actions)

 *Docker workflows – build and scan Docker images.

 *ECR workflows – push images to Amazon ECR.

 *Terraform workflows – run plan, apply, and optionally destroy infrastructure.
