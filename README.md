# Tech Challenge 2  
**Application Deployment: Containerization, IaC, Kubernetes & CI/CD**

## Overview
This project deploys a simple Flask web application that returns **Hello, World!**. The application is containerized with Docker, stored in Amazon ECR, deployed to Amazon EKS using Helm, and automated through a Jenkins CI/CD pipeline. Infrastructure is provisioned with Terraform.

## Architecture
GitHub → Jenkins → Docker Build → Amazon ECR → Amazon EKS → Helm Deployment → LoadBalancer URL

## Tech Stack
- Python Flask
- Docker
- Terraform
- AWS ECR
- AWS EKS
- Kubernetes
- Helm
- Jenkins

## Project Structure
```text
tech-challenge-2/
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
├── helm/
│   └── hello-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
├── jenkins/
│   └── Jenkinsfile
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── ecr.tf
│   ├── vpc.tf
│   └── eks.tf
└── README.md
Application

The application is a Flask web app with:

/ → returns Hello, World!
/health → returns OK
Docker

The application is containerized with Docker.

Build locally
cd app
docker build -t hello-app .
Run locally
docker run -p 5000:5000 hello-app
Test locally
http://localhost:5000
http://localhost:5000/health
Terraform Setup

Terraform provisions:

Amazon ECR repository
VPC
Public and private subnets
Internet Gateway
NAT Gateway
Amazon EKS cluster
Managed node group
Initialize Terraform
cd terraform
terraform init
Validate
terraform validate
Apply
terraform apply
EKS Configuration

After Terraform completes, connect to the cluster:

aws eks update-kubeconfig --region us-east-2 --name tech-challenge-2-cluster

Verify:

kubectl get nodes
Helm Deployment

The application is deployed with Helm.

Lint chart
helm lint ./helm/hello-app
Install / upgrade
helm upgrade --install hello-app ./helm/hello-app
Verify
kubectl get deployments
kubectl get pods
kubectl get svc
kubectl get hpa
Autoscaling

Horizontal Pod Autoscaler is configured with:

Minimum replicas: 1
Maximum replicas: 12
CPU utilization target: 50%
Memory utilization target: 50%
Jenkins CI/CD Pipeline

Jenkins automates the following stages:

Checkout code from GitHub
Build Docker image
Tag image for ECR
Login to Amazon ECR
Push image to ECR
Update kubeconfig for EKS
Deploy to EKS using Helm
Verify deployment
Jenkins Pipeline File

Pipeline definition is stored here:

jenkins/Jenkinsfile
ECR Repository
182399722683.dkr.ecr.us-east-2.amazonaws.com/tech-challenge-2-app
Deployment Verification

Successful deployment was validated with:

kubectl get deployments
kubectl get pods
kubectl get svc
kubectl get hpa