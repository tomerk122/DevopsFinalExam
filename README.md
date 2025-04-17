# DevOps Final Exam Project

## Overview
This project demonstrates a comprehensive DevOps pipeline for a Flask-based AWS monitoring application. The application monitors various AWS resources including EC2 instances, VPCs, Load Balancers, and AMIs owned by the account.

## Project Structure
- **Section 1**: Terraform Infrastructure
- **Section 2**: Dockerizing the Application
- **Section 3**: Debugging
- **Section 5**: Jenkins CI/CD
- **Section 6**: Azure Pipeline
- **Section 7**: Kubernetes Deployment
- **Helm Chart**: flask-aws-monitor

## Application Details
The application is a Flask-based AWS resource monitor that displays:
- EC2 instances
- VPCs
- Load Balancers
- AMIs owned by the account

The application runs on port 5001 and requires AWS credentials to function properly.

## Section Details

### Section 1: Terraform Infrastructure
The infrastructure is provisioned using Terraform in `Section1-Terraform`. It creates:
- EC2 instance (t3.medium) with Ubuntu 22.04 LTS
- Security group allowing traffic on ports 22, 8080, and 5001
- SSH key pair for secure access

**Commands:**
```bash
cd Section1-Terraform
terraform init
terraform plan
terraform apply
```

### Section 2: Dockerizing the Application
The `section2-Dockerizing` folder contains the Docker implementation for the Flask application, using multi-stage builds to optimize the image size.

**Key Features:**
- Multi-stage build process
- Environment variable configuration
- Proper port exposure (5001)

**Commands:**
```bash
cd section2-Dockerizing
docker build -t my-python-app .
docker run -p 5001:5001 my-python-app
```

### Section 3: Debugging
The `section3-debugging` folder contains the debugged version of the application. The main bugs fixed were:
- Missing VPC initialization: `vpcs = ec2_client.describe_vpcs()`
- Missing load balancer initialization: `lbs = elb_client.describe_load_balancers()`
- Missing AMI query with proper ownership filter: `amis = ec2_client.describe_images(Owners=["self"])`

### Section 5: Jenkins CI/CD
The `Section5-Jenkins` folder contains a Jenkins pipeline configuration that:
- Clones the repository
- Runs parallel linting and security scanning
- Installs dependencies
- Builds and tags Docker images
- Pushes images to DockerHub

### Section 6: Azure Pipeline
The `section6-AzurePipe` folder contains an Azure DevOps pipeline that:
- Clones the repository
- Performs parallel linting and security checks
- Builds the Docker image
- Pushes the image to DockerHub

### Section 7: Kubernetes Deployment
The `section7-K8S` folder contains Kubernetes manifests:
- Deployment with 3 replicas
- LoadBalancer service exposing port 80 and targeting container port 5001

**Commands:**
```bash
kubectl apply -f section7-K8S/deployment.yaml
kubectl apply -f section7-K8S/service.yaml
```

### Helm Chart: flask-aws-monitor
The `flask-aws-monitor` folder contains a Helm chart for deploying the application to Kubernetes with customizable values:
- Configurable replica count
- Image repository and tag settings
- Service type configuration

**Commands:**
```bash
helm install flask-monitor flask-aws-monitor/
```