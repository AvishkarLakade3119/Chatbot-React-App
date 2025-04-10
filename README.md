# 🚀 Chatbot CI/CD Deployment with Jenkins on AWS

## 🧠 About the Project
An AI-powered chatbot app integrated with **Google Gemini AI**, deployed using a complete DevOps CI/CD pipeline built with **Jenkins**, **Docker**, and **AWS EC2**.

---

## 📁 Project Structure
/ ├── client/ # React + Vite frontend ├── server/ # Node.js backend ├── Dockerfile # For backend ├── client/Dockerfile # For frontend ├── Jenkinsfile # CI/CD pipeline script ├── .github/workflows # (Optional) for GitHub Actions └── README.md


---

## 🛠️ Tech Stack

- **Frontend**: React (Vite)
- **Backend**: Node.js
- **AI Integration**: Google Gemini API
- **CI/CD**: Jenkins
- **Containerization**: Docker
- **Hosting**: AWS EC2

---

## ⚙️ DevOps Flow

1. Code is pushed to GitHub
2. GitHub Webhook triggers Jenkins pipeline
3. Jenkins clones the repo and builds Docker images
4. Containers are run on the EC2 instance
   - Backend: Port `8001`
   - Frontend: Port `5173` exposed via `80`

---

## 🔧 Jenkins Pipeline Setup

### Installed Jenkins on EC2:
- Installed Jenkins manually on an Ubuntu EC2 instance
- Opened inbound ports: 22, 80, 8001, 8080
- Installed required Jenkins plugins (Docker, Git, etc.)

### Jenkins Job Configuration:
- Configured GitHub webhook to trigger build on push
- Wrote the `Jenkinsfile` as follows:

```groovy
pipeline {
  agent any
  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/AvishkarLakade3119/Chatbot-React-App'
      }
    }
    stage('Build Docker Images') {
      steps {
        sh 'docker build -t chatbot-backend ./server'
        sh 'docker build -t chatbot-frontend ./client'
      }
    }
    stage('Run Containers') {
      steps {
        sh 'docker run -d -p 8001:8001 chatbot-backend'
        sh 'docker run -d -p 80:5173 chatbot-frontend'
      }
    }
  }
}

📦 Docker Overview
Backend Dockerfile builds the Node.js server and listens on port 8001

Frontend Dockerfile serves the React app via Vite on port 5173 (mapped to port 80)

📈 Monitoring & Logs
Jenkins console output used for monitoring pipeline status
Used Docker CLI for container logs:
docker ps          # To check running containers
docker logs <id>   # To debug issues
EC2 Instance terminal used for real-time monitoring

📌 Notes
Project deployed without custom domain or Route 53
App is accessible using EC2's public IP and exposed ports
This project demonstrates an end-to-end DevOps CI/CD workflow using AI


