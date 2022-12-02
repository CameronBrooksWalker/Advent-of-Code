$input = Get-Content .\input.txt

$coord=0,0

foreach($line in $input){

    switch -Wildcard ($line) {
        'forward*' {$coord[0] += [convert]::ToInt32($line[-1],10)}
        'down*' { $coord[1] += [convert]::ToInt32($line[-1],10)}
        'up*' {$coord[1] -= [convert]::ToInt32($line[-1],10)}
    }
}

Write-Host ($coord[0] * $coord[1])