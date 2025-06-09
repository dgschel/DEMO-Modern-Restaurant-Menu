@description('Der Name der Static Web App')
param name string = toLower('${githubRepoName}')

@description('Der Standort')
param location string = 'westeurope'

@description('GitHub Repo Besitzer, z. B. dein Benutzername')
param githubRepoOwner string

@description('Repo-Name')
param githubRepoName string

@description('Branch')
param githubBranch string = 'master'

@description('Output-Ordner nach Build')
param outputLocation string

@description('App-Ordner im Repo')
param appLocation string = '/'

@description('SKU (Free oder Standard)')
param skuName string = 'Free'

resource staticWebApp 'Microsoft.Web/staticSites@2024-11-01' = {
  name: name
  location: location
  sku: {
    name: skuName
    tier: skuName
  }
  properties: {
    repositoryUrl: 'https://github.com/${githubRepoOwner}/${githubRepoName}'
    branch: githubBranch
    buildProperties: {
      appLocation: appLocation
      apiLocation: ''
      outputLocation: outputLocation
    }
    provider: 'GitHub'
  }
}
