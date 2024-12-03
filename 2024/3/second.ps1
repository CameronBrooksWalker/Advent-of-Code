$timer =  [Diagnostics.Stopwatch]::StartNew()

$input = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\3\input"

$grabdodonts = "mul\(\d{1,3},\d{1,3}\)|don't\(\)|do\(\)"

$grabints = '\d{1,3}'

$isactive = $true

foreach($value in [regex]::Matches($input, $grabdodonts).Value)
{

    if($value -like "do()"){$isactive = $true}
    elseif($value -like "don't()"){$isactive = $false}
    elseif($isactive)
    {
        [int[]]$curints = [regex]::Matches($value, $grabints).Value
    
        [int]$total += ($curints[0] * $curints[1])
    }

}

write-host "total is :" $total -BackgroundColor Green

$timer.stop(); Write-Host "Script ran in:" $timer.elapsed.milliseconds "milliseconds" -BackgroundColor Gray -ForegroundColor Red