param(
    [string]$registryPath,
    [string]$registryKeyName, 
    [string]$registryLocation, 
    [string]$hashKey
)

function Update-Key($registryLocation, $value){    
    if(Test-Path $registryLocation){
        Write-Host "Cert Hash Updating at $registryLocation" -ForegroundColor Magenta
        Get-ItemProperty $registryLocation
        Set-ItemProperty -Path $registryLocation -Name $registryKeyName -Value $value
        Write-Host "Cert hash updating to $value" -ForegroundColor Magenta
    }else{
        Write-Host "Registry key not found at $registryLocation" -ForegroundColor Red
    }
}

if(Test-Path $registryPath){
    Write-Host "Starting registry updates" -ForegroundColor Magenta
    Update-Key ($registryPath + $registryLocation) $hashKey
    Write-Host "Finished registry updates" -ForegroundColor Magenta
}else{
    Write-Host "Registry was not found at " + $registryPath -ForegroundColor Red
}