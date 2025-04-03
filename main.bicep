@description('The name of the Static Web App resource')
param staticWebAppName string

@description('Location for all resources')
param location string = resourceGroup().location

@description('The SKU for the Static Web App')
@allowed([
  'Free'
  'Standard'
])
param sku string = 'Free'

@description('The GitHub repository URL')
param repositoryUrl string = ''

@description('The branch of the GitHub repository')
param branch string = 'main'

@description('The GitHub repository token')
@secure()
param repositoryToken string = ''

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: staticWebAppName
  location: location
  sku: {
    name: sku
    tier: sku
  }
  properties: {
    // If repository details are provided, configure source control
    repositoryUrl: !empty(repositoryUrl) ? repositoryUrl : null
    branch: !empty(repositoryUrl) ? branch : null
    repositoryToken: !empty(repositoryUrl) ? repositoryToken : null
    buildProperties: {
      appLocation: '/app'
      apiLocation: ''
      outputLocation: ''
    }
  }
}

output staticWebAppDefaultHostname string = staticWebApp.properties.defaultHostname
output staticWebAppId string = staticWebApp.id
