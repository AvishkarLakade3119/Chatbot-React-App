🚀 Chatbot CI/CD Deployment with Jenkins on AWS
🧠 About the Project
An AI-powered chatbot integrated with Google Gemini AI, deployed through a complete DevOps CI/CD pipeline.

📁 Project Structure
bash
Copy
Edit
/
├── client/             # React + Vite frontend
├── server/             # Node.js backend
├── Dockerfile          # For backend
├── client/Dockerfile   # For frontend
├── Jenkinsfile         # CI/CD pipeline script
└── README.md
🛠️ Tech Stack
Frontend: React (Vite)

Backend: Node.js

AI Integration: Google Gemini

CI/CD: Jenkins

Containerization: Docker

Hosting: AWS EC2

⚙️ CI/CD Workflow
Push code to GitHub

Jenkins job is triggered via webhook

Jenkins builds Docker images

Images are deployed on EC2

Backend runs on port 8001, frontend on port 80

🧪 Jenkins Pipeline Configuration
Jenkinsfile:

groovy
Copy
Edit
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
📈 Monitoring & Logs
Jenkins console output

EC2 instance terminal

Docker logs via docker logs <container_id>
