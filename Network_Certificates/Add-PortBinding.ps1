Param(
  [string]$hostname,
  [string]$thumbprint,
  [string]$appId,
  [string]$ipAddress,
  [string]$port
)

if([string]::IsNullOrEmpty($thumbprint)){
    $thumbprint = (Get-ChildItem cert:\LocalMachine\Root | where-object { $_.Subject -like "*$hostname*" } | Select-Object -Last 1).Thumbprint
    Write-Host "Changed thumbrpint to $thumbprint" -ForegroundColor Yellow
}

if([string]::IsNullOrEmpty($appId)){
    $appId = [guid]::NewGuid().ToString("B")
    Write-Host "Changed appId id to $appId" -ForegroundColor Yellow
}

if([string]::IsNullOrEmpty($port)){
    $portIpFormat = $ipAddress + ":" + $port
}else{
    $portIpFormat = $ipAddress
}

netsh http add sslcert ipport="$portIpFormat" certhash=$thumbprint certstorename=Root appid=$appId clientcertnegotiation=enable
netsh http show sslcert ipport="$portIpFormat"