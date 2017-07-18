Param(
    [string]$fileLocation,
    [string]$lineToAppendAbove,
    [string]$newLineValue
)

$lines = Get-Content $fileLocation
$pos = [array]::indexof($lines, $lineToAppendAbove)
$newLines = $lines[0..($pos - 1)], $newLineValue, $lines[$pos..($lines.Length - 1)]
$newLines | Set-Content $fileLocation