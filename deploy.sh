#!/bin/bash

# Set variables
RESOURCE_GROUP_NAME="static-webapp-rg"
LOCATION="eastus2"

# Create resource group if it doesn't exist
echo "Checking if resource group exists..."
az group show --name $RESOURCE_GROUP_NAME > /dev/null 2>&1
if [ $? -ne 0 ]
then
  echo "Creating resource group $RESOURCE_GROUP_NAME in $LOCATION..."
  az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
fi

# Deploy the Bicep template
echo "Deploying Bicep template..."
az deployment group create \
  --name staticWebAppDeployment \
  --resource-group $RESOURCE_GROUP_NAME \
  --template-file main.bicep \
  --parameters @parameters.json

# Get the deployment outputs
echo "Deployment complete. Azure Static Web App has been provisioned."
