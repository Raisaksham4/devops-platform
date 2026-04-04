# 🚀 Full DevOps Automation Platform (AWS)

## 📌 Overview

This project demonstrates a complete end-to-end DevOps pipeline that automates application build, containerization, and deployment using AWS and GitHub Actions.

The pipeline enables seamless integration from code push to live deployment without manual intervention.

---

## 🧱 Architecture

Code → GitHub → CI/CD Pipeline → Docker → AWS ECR → EC2 → Live Application

---

## ⚙️ Tech Stack

* **Cloud**: AWS (EC2, ECR, IAM)
* **CI/CD**: GitHub Actions
* **Containerization**: Docker
* **Backend**: Node.js (Express)
* **OS**: Linux

---

## 🔄 Workflow

1. Developer pushes code to GitHub
2. GitHub Actions triggers CI/CD pipeline
3. Docker image is built automatically
4. Image is pushed to AWS ECR
5. EC2 instance pulls latest image
6. Container is deployed and updated automatically

---

## 🔐 Security

* IAM roles used for secure access to AWS services
* Secrets managed using GitHub Secrets
* No hardcoded credentials

---

## 🚀 Features

* Fully automated CI/CD pipeline
* Zero manual deployment
* Docker-based containerization
* Secure AWS integration
* Real-time deployment on EC2

---

## 📸 Output

Application successfully deployed and accessible via public IP.

---

## 📈 Future Improvements

* Add Load Balancer (ALB)
* Implement HTTPS with custom domain
* Use Terraform for Infrastructure as Code
* Deploy using AWS ECS for scalability

---

## 👨‍💻 Author

Saksham Rai
