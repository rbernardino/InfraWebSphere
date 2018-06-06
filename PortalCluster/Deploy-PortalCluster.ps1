break

#region Deploy portal servers
{
  $location = 'East US'
  $resourceGroupName = 'azurePortalServers'
  $resourceDeploymentName = 'azurePortalServers-deployment'
  $templateFile = '.\azrmtemplates\portal.vms.linux.json'
  $templateParameterFile = '.\azrmtemplates\portal.vms.linux.parameters.json'

  New-AzureRmJsonTemplateDeployment `
    -ResourceGroupName $resourceGroupName `
    -DeploymentName $resourceDeploymentName `
    -Location $location `
    -Path $templateFile `
    -TemplateParameterFile $templateParameterFile `
    -Verbose -Force 

  # Cleanup if needed
  Remove-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Force -Verbose
}
#endregion