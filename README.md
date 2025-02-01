# 🌟 ModelCraft - Automated AI Model Installation & Configuration

[![GitHub License](https://img.shields.io/github/license/your-repo/modelcraft)](LICENSE)
[![PowerShell](https://img.shields.io/badge/powershell-5.0+-blue.svg)](https://docs.microsoft.com/powershell/)
[![Docker](https://img.shields.io/badge/docker-ready-blue.svg)](https://www.docker.com/)

---

## 🚀 Overview

**ModelCraft** is an automated **PowerShell** script designed to simplify the installation and configuration of **Ollama**, **Open WebUI**, and pre-configured **AI models**. This tool is tailored for developers and AI enthusiasts to get their AI environments up and running quickly with minimal effort.

### 🔹 Key Highlights:
- 🔹 **One-Click Installation**: Automates the setup of Ollama, Open WebUI, and required models.
- 🔹 **Pre-Configured Models**: Installs models like **DeepSeek-R1:8B** and **qwen2.5:7b**.
- 🔹 **Docker Integration**: Seamless setup of Open WebUI using Docker.
- 🔹 **Automatic Port Management**: Dynamically finds available ports to avoid conflicts.

---

## 📉 Features

👉 **Automated Ollama Installation**: Checks for existing installation and installs if not present.

👉 **Open WebUI Setup**: Automatically pulls and configures Open WebUI in Docker.

👉 **Model Pulling**: Automatically pulls AI models like **DeepSeek-R1:8B** and **qwen2.5:7b**.

👉 **Dynamic Port Allocation**: Finds available ports to run services without conflicts.

---

## 📊 Prerequisites

- **PowerShell 5.0+** (Pre-installed on Windows 10 and later)
- **Docker Desktop** (Ensure Docker is installed and running)

---

## 📅 Installation & Setup

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/your-repo/modelcraft.git
cd modelcraft
```

### **2️⃣ Run the PowerShell Script**
```powershell
.\Initialize.ps1
```

This script will:
1. **Check and install Ollama** if not already installed.
2. **Set up Open WebUI** via Docker.
3. **Pull the specified AI models**.

---

## 🚧 Script Details

### **Configuration**
The script is pre-configured with default values:
```powershell
$config = @{
    ollamaInstaller = "https://ollama.com/download/OllamaSetup.exe"
    ollamaPath = "C:\\Program Files\\Ollama\\ollama.exe"
    dockerImage = "ghcr.io/open-webui/open-webui:main"
    containerName = "open-webui"
    webUIPort = 8080
    dataVolume = "open-webui"
    models = @('DeepSeek-R1:8B', 'qwen2.5:7b')
}
```

### **Key Functions**
- **Install-Ollama**: Downloads and installs Ollama.
- **Install-OpenWebUI**: Pulls the Open WebUI Docker image and runs the container.
- **Pull-Models**: Pulls AI models using Ollama.
- **Get-AvailablePort**: Finds an available port for running the WebUI.

---

## 🔢 Usage Guide

### 🔍 **Access the Web UI**
Once the script completes, access the Open WebUI via your browser:
```
http://localhost:8080
```

### 📊 **Manage Models**
You can interact with the pulled models via Ollama CLI:
```bash
ollama run DeepSeek-R1:8B
ollama run qwen2.5:7b
```

---

## 🔧 Troubleshooting

- **Docker Not Found**: Ensure Docker Desktop is installed and running.
- **Port Conflicts**: The script dynamically assigns ports. Check if any other application is using port **8080**.
- **Manual Model Installation**: If model pulling fails, manually run:
```bash
ollama pull DeepSeek-R1:8B
ollama pull qwen2.5:7b
```

---

## 👫 Contributing

We welcome contributions! Follow these steps:
1. **Fork** the repository.
2. **Create a feature branch**:
```bash
git checkout -b feature-new-model
```
3. **Commit your changes**:
```bash
git commit -m "Add new model support"
```
4. **Push and submit a pull request**:
```bash
git push origin feature-new-model
```

---

## 📝 License

This project is **MIT Licensed**. See the [LICENSE](LICENSE) file for more details.

---

## 📢 Connect with Us

📧 **Email**: support@modelcraft.ai

---

**ModelCraft** simplifies the process of AI model management. Get started now and streamline your AI workflows! 🚀

