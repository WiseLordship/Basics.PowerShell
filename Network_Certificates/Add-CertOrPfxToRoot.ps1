Param(
    [string]$certLocation,
    [string]$pfxLocation,
    [string]$password
)

CERTUTIL -addstore Root $certLocation
CERTUTIL -f -p $password -importpfx Root $pfxLocation