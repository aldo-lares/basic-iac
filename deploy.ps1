# Set variables
$RESOURCE_GROUP_NAME = "static-webapp-rg"
$LOCATION = "eastus2"

# Create resource group if it doesn't exist
Write-Host "Checking if resource group exists..."
$rgExists = az group exists --name $RESOURCE_GROUP_NAME
if ($rgExists -eq "false") {
  Write-Host "Creating resource group $RESOURCE_GROUP_NAME in $LOCATION..."
  az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
}

# Deploy the Bicep template
Write-Host "Deploying Bicep template..."
az deployment group create `
  --name staticWebAppDeployment `
  --resource-group $RESOURCE_GROUP_NAME `
  --template-file main.bicep `
  --parameters "@parameters.json"

# Get the deployment outputs
Write-Host "Deployment complete. Azure Static Web App has been provisioned."
