[Environment]::SetEnvironmentVariable("PATHEXT", "$ENV:PATHEXT;.PY", "USER")
$mypath = $MyInvocation.MyCommand.Path
$mypath = Split-Path $mypath -Parent
cd $mypath
cd ..
$mypath = $pwd
[Environment]::SetEnvironmentVariable("PATH", "$ENV:PATH;$mypath", "USER")