# Azure Static Web App with Bicep

This project demonstrates how to deploy an Azure Static Web App using Bicep as Infrastructure as Code.

## Prerequisites

- Azure CLI installed
- Azure subscription
- Visual Studio Code with Bicep extension (recommended)

## Project Structure

- `main.bicep`: Main Bicep template for Static Web App
- `parameters.json`: Parameters for the deployment
- `deploy.sh` (or `deploy.ps1`): Deployment script
- `app/`: Sample static website

## Deployment

1. Login to Azure CLI:
   ```
   az login
   ```

2. Run the deployment script:
   ```
   ./deploy.sh
   ```
   
   Or on Windows:
   ```
   .\deploy.ps1
   ```

## Resources Created

- Azure Static Web App
- GitHub Actions workflow configuration (optional)