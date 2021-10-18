#get actions parameters
param (
    [string] $userName,
    [string] $passWord,
    [string] $clientId,
    [string] $clientSecret,
    [string] $tenantId
)

#get static parameters
$params = Get-Content -Raw -Path .\params.json | ConvertFrom-Json


# Get input values
$authenticationType = $params.AuthenticationType


#connected service
# $userName =  $serviceEndpoint.Auth.Parameters.username
# $passWord = $serviceEndpoint.Auth.Parameters.password
# $clientId = $serviceEndpoint.Data.clientId
# $clientSecret = $serviceEndpoint.Auth.Parameters.servicePrincipalKey
# $tenantId = $serviceEndpoint.Auth.Parameters.tenantId

if($password){
	$passWord = ConvertTo-SecureString $passWord -AsPlainText -Force
}

if($clientSecret){
	$secret = ConvertTo-SecureString $clientSecret -AsPlainText -Force
}


#parameters
$filePattern = $params.PowerBIPath
$workspaceName = $params.WorkspaceName
$overwrite = $params.OverWrite
$create = $params.Create
$action = $params.Action
$dataset = $params.DatasetName
$oldUrl = $params.OldUrl
$newUrl = $params.NewUrl
$oldServer = $params.OldServer
$newServer = $params.NewServer
$oldDatabase = $params.OldDatabase
$groupObjectIds = $params.GroupObjectIds
$newDatabase = $params.NewDatabase
$accesRight = $params.Permission
$users = $params.Users
$datasourceType = $params.DatasourceType
$updateAll = $params.UpdateAll
$ServicePrincipalsString = $params.ServicePrincipals 
$ConnectionString = $params.ConnectionString


#run task
if($authenticationType -eq "User"){
	.\run-task.ps1 -Username $userName -OldUrl $oldUrl -NewUrl $newUrl -OldServer $oldServer -DatasourceType $datasourceType -NewServer $newServer -OldDatabase $oldDatabase -NewDatabase $newDatabase -AccessRight $accesRight -Users $users -FilePattern $filePattern -Password $passWord -ClientId $clientId -WorkspaceName $workspaceName -Overwrite $overwrite -Create $create -Dataset $dataset -Action $action -UpdateAll $UpdateAll -ClientSecret $secret -TenantId $TenantId 
}
else {
	.\run-task.ps1 -Username $userName -OldUrl $oldUrl -NewUrl $newUrl -OldServer $oldServer -DatasourceType $datasourceType -NewServer $newServer -OldDatabase $oldDatabase -NewDatabase $newDatabase -AccessRight $accesRight -Users $users -FilePattern $filePattern -Password $passWord -ClientId $clientId -WorkspaceName $workspaceName -Overwrite $overwrite -Create $create -Dataset $dataset -Action $action -UpdateAll $UpdateAll -ClientSecret $secret -TenantId $tenantId -ServicePrincipalString $ServicePrincipalsString -ConnectionString $ConnectionString -GroupObjectIds $groupObjectIds
}
