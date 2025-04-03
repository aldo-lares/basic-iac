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
- `.github/workflows/azure-deploy.yml`: GitHub Actions workflow for automated deployment

## Deployment

### Manual Deployment

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

### GitHub Actions Deployment

This project includes a GitHub Actions workflow that automates the deployment process.

To set up GitHub Actions deployment:

1. Fork or push this repository to your GitHub account

2. Create the following secrets in your GitHub repository:
   - `AZURE_CREDENTIALS`: Azure service principal credentials JSON
   - `AZURE_RESOURCE_GROUP`: Name of your Azure resource group

3. To create the Azure credentials:
   ```bash
   az ad sp create-for-rbac --name "myStaticWebAppSP" --role contributor \
     --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
     --sdk-auth
   ```

4. Copy the JSON output and save it as the `AZURE_CREDENTIALS` secret in your GitHub repository.

5. Deployments will automatically run on push to main branch, or you can manually trigger the workflow from the Actions tab.

## Resources Created

- Azure Static Web App
- GitHub Actions workflow configuration