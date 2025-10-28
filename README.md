# ☁️ AWS Auto-Scaling Infrastructure using Terraform + Jenkins CI/CD
This project demonstrates how to **design, deploy, and automate** a complete AWS infrastructure using **Terraform** (IaC) and **Jenkins** (CI/CD automation).  

All resources were **successfully deployed, validated, and later destroyed** to avoid costs — following real-world DevOps practices.

## 🧩 Project Summary

- Built an **AWS VPC** with public/private subnets across two AZs  
- Deployed **EC2 instances** via Auto Scaling Group (ASG) behind an **Application Load Balancer (ALB)**  
- Configured **CloudWatch Alarms** and **SNS alerts** for monitoring  
- Set up a **Jenkins pipeline** that automatically runs `terraform plan` and `apply` on each GitHub push  
- Verified **ALB health checks**, **scaling activity**, and **CI/CD automation**  
- Destroyed all infrastructure responsibly using `terraform destroy
  
## 🧱 Architecture Diagram
      +-------------------+
      |   User Requests   |
      +-------------------+
                |
         +---------------+
         | Application LB |
         +---------------+
                |
      +-----------------------+
      |  Auto Scaling Group   |
      |  (EC2 Web Servers)    |
      +-----------------------+
                |
         +---------------+
         |   NAT Gateway  |
         +---------------+
                |
         +---------------+
         | Internet GW   |
         +---------------+
                |
         +---------------+
         |   Jenkins CI  |
         +---------------+


---

## ⚙️ Tech Stack

| Category | Tool / Service |
|-----------|----------------|
| Cloud | AWS (VPC, EC2, ALB, ASG, IAM, CloudWatch, SNS) |
| IaC | Terraform |
| CI/CD | Jenkins |
| Monitoring | CloudWatch |
| Scripting | Bash |
| Version Control | Git & GitHub |
| OS | Ubuntu 22.04 |

---

## 🚀Steps Implemented

### 1️⃣ Infrastructure Deployment (Terraform)
- Created **VPC**, **subnets**, **route tables**, **IGW**, and **NAT Gateway**  
- Configured **security groups** for EC2 and ALB communication  
- Deployed **ALB**, **Target Group**, and **Auto Scaling Group**  
- Bootstrapped EC2 web servers using `user-data.sh`  

### 2️⃣ CI/CD Automation (Jenkins)
- Installed **Jenkins**, **Terraform**, and **AWS CLI** on EC2  
- Added AWS credentials securely using Jenkins credentials manager  
- Configured a pipeline with stages: *Checkout → Plan → Apply*  
- Triggered builds automatically via GitHub webhook  

### 3️⃣ Monitoring & Alerts
- Added **CloudWatch alarms** for EC2 CPU utilization  
- Integrated **SNS topic** for email alerts  
- Created **target tracking policy** for automatic scaling  

### 4️⃣ Validation
- ALB → EC2 health checks turned healthy  
- Auto Scaling launched new instances under load  
- Verified Jenkins pipeline executed Terraform end-to-end  

### 5️⃣ Cleanup (Proof of Completion)
After validation, all resources were destroyed safely:
```bash
terraform destroy -auto-approve


Deleted resources included:

✅ 1 VPC, 2 public + 2 private subnets

✅ 1 Internet Gateway, 1 NAT Gateway

✅ 1 Application Load Balancer + Target Group

✅ 1 Auto Scaling Group + 2 EC2 instances

✅ 2 Security Groups (ALB + EC2)

✅ 1 SNS topic and CloudWatch alarms

✅ 1 Jenkins EC2 instance (manual termination)

📉 All resources terminated successfully — AWS cost = $0.00 (Free Tier).


Key Learnings

Building production-ready AWS architectures via Terraform

Integrating IaC with Jenkins pipelines

Managing IAM roles and least privilege access

Debugging ALB health checks and subnet routing

Implementing monitoring and alert automation

Practicing real-world cost optimization

