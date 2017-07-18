param(
    [string]$fileLocation,
    [string]$placeHolder, 
    [string]$replacementValue
)


(Get-Content $fileLocation) | foreach { $_ -replace $placeHolder, $replacementValue } | Set-Content $fileLocation