# Mini DevOps Dashboard

## 1. Project Description

Mini DevOps Dashboard is a simple web application built using HTML, CSS, and JavaScript.

The application demonstrates basic frontend functionality and serves as a project for practicing DevOps tools and CI/CD automation.

### Features

- Digital clock displaying the current time.
- Interactive click counter.
- Light and dark theme switcher.
- Frontend health-check button.
- Responsive user interface.

## 2. Technologies Used

- HTML5
- CSS3
- JavaScript
- Docker
- GitHub Actions
- Docker Hub
- AWS EC2
- Terraform

## 3. Project Structure

```text
project/
├── src/
│   ├── index.html
│   ├── style.css
│   └── script.js
├── Dockerfile
├── .dockerignore
├── .gitignore
├── README.md
└── .github/
    └── workflows/
        └── deploy.yml
```

## 4. Local Setup and Installation

### Prerequisites

Make sure the following tools are installed:

- Docker
- Git

### Step 1. Clone the repository

```bash
git clone YOUR_REPOSITORY_URL
cd YOUR_PROJECT_DIRECTORY
```

### Step 2. Build the Docker image

```bash
docker build -t mini-devops-dashboard .
```

### Step 3. Run the container

```bash
docker run -d -p 8080:80 --name mini-dashboard mini-devops-dashboard
```

### Step 4. Open the application

Open the following address in your browser:

```text
http://localhost:8080
```

### Step 5. Stop the container

```bash
docker stop mini-dashboard
docker rm mini-dashboard
```

## 5. Environment Variables and Secrets

The application does not require any environment variables to run locally.

The following GitHub Actions repository secrets are used for automated Docker image publishing and deployment to AWS EC2.

| Secret | Description |
|---|---|
| `DOCKERHUB_USERNAME` | Docker Hub username |
| `DOCKERHUB_TOKEN` | Docker Hub access token |
| `EC2_HOST` | Public IP address or DNS name of the EC2 instance |
| `EC2_USER` | SSH username for the EC2 instance |
| `EC2_SSH_KEY_B64` | Base64-encoded private SSH key |

### Adding GitHub Secrets

1. Open your GitHub repository.
2. Navigate to **Settings → Secrets and variables → Actions**.
3. Select **New repository secret**.
4. Add each secret using the exact name listed above.
5. Enter the corresponding value.

**Security Notes:**

- Never commit passwords, tokens, private SSH keys, or AWS credentials to the repository.
- Never publish your `.env` files or private keys.
- Use GitHub Secrets to store sensitive information.
- Do not expose secret values in GitHub Actions logs.

## 6. CI/CD Pipeline

GitHub Actions is used to automate the deployment process.

The pipeline is designed to:

1. Trigger when changes are pushed to the main branch.
2. Build the Docker image.
3. Authenticate with Docker Hub.
4. Push the Docker image to Docker Hub.
5. Connect to the AWS EC2 instance through SSH.
6. Deploy and run the updated Docker container.

## 7. Infrastructure

AWS EC2 is used to host the application.

Terraform is used to define and manage cloud infrastructure.

Docker provides a consistent environment for building and running the application.

## 8. Project Goal

The main goal of this project is to practice containerization, infrastructure management, CI/CD automation, and cloud deployment using modern DevOps technologies.
