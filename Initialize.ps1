# Configuration
$config = @{
    ollamaInstaller = "https://ollama.com/download/OllamaSetup.exe"
    ollamaPath = "C:\Program Files\Ollama\ollama.exe"
    dockerImage = "ghcr.io/open-webui/open-webui:main"
    containerName = "open-webui"
    webUIPort = 8080
    dataVolume = "open-webui"
    models = @('DeepSeek-R1:8B', 'qwen2.5:7b')  # Added models
}

# Function to find an available port
function Get-AvailablePort {
    param ([int]$startPort = 8080)
    $port = $startPort
    while ($true) {
        $test = netstat -an | Select-String ":$port"
        if (-not $test) {
            return $port
        }
        $port++
    }
}

# Function to check if Ollama is installed
function Check-OllamaInstalled {
    if (Test-Path $config.ollamaPath) {
        Write-Host "Ollama is already installed."
        return $true
    } else {
        Write-Host "Ollama not found. Proceeding with installation..."
        return $false
    }
}

# Function to install Ollama
function Install-Ollama {
    $installerPath = "$env:TEMP\OllamaSetup.exe"
    Write-Host "Downloading Ollama installer..."
    Invoke-WebRequest -Uri $config.ollamaInstaller -OutFile $installerPath
    
    Write-Host "Running Ollama installer..."
    Start-Process -FilePath $installerPath -ArgumentList "/silent" -Wait
    
    if (Test-Path $config.ollamaPath) {
        Write-Host "Ollama installed successfully."
    } else {
        Write-Host "Ollama installation failed. Please install manually."
        Exit 1
    }
}

# Function to install and configure Open WebUI
function Install-OpenWebUI {
    Write-Host "Checking for Docker installation..."
    if (!(Get-Command docker -ErrorAction SilentlyContinue)) {
        Write-Host "Docker not found. Please install Docker Desktop and restart this script."
        Exit 1
    }
    
    Write-Host "Pulling WebUI Docker image..."
    docker pull $config.dockerImage
    
    Write-Host "Checking for existing WebUI container..."
    $container = docker ps -a --filter "name=$($config.containerName)" --format '{{.Names}}'
    if ($container -eq $config.containerName) {
        Write-Host "WebUI container already exists. Restarting..."
        docker restart $config.containerName
    } else {
        $config.webUIPort = Get-AvailablePort $config.webUIPort
        Write-Host "Creating and starting WebUI container on port $($config.webUIPort)..."
        docker run -d -p $($config.webUIPort):8080 --name $config.containerName -v $($config.dataVolume):/app/backend/data $config.dockerImage
    }
    
    Write-Host "Open WebUI is running at http://localhost:$($config.webUIPort)"
}

# Function to pull models using Ollama
function Pull-Models {
    foreach ($model in $config.models) {
        Write-Host "Pulling model: $model"
        & $config.ollamaPath pull $model
    }
}

# Main script logic
if (-not (Check-OllamaInstalled)) {
    Install-Ollama
}

Install-OpenWebUI
Pull-Models
