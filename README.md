# 🚀 10-Day DevOps Journey — Capstone Project

A hands-on portfolio demonstrating core DevOps practices — built over 10 days with zero sudo, using only user-space automation.

## 🔧 Tools & Practices
- **Git**: Branching, merging, conventional commits  
- **CI/CD**: GitHub Actions for linting and Docker builds  
- **IaC**: Ansible for environment setup  
- **Containers**: Docker + Compose (frontend + backend + Redis)  
- **Observability**: Log monitoring and alerting  
- **Registry**: Published images to GitHub Container Registry (GHCR)

## 📦 Services
- **Frontend**: Static HTML served by Nginx
- **Backend**: Node.js API (`/api` endpoint)
- **Health Checks**: Automated via cron (`system-health-check.sh`)
- **Alerts**: Error detection in logs (`log-alert.sh`)

## ▶️ How to Use

### 1. Set up your environment (user-space)
```bash
ansible-playbook -i ansible/inventory.yml ansible/playbooks/setup-devops-env.yml
