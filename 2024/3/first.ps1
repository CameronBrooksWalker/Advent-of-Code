$timer =  [Diagnostics.Stopwatch]::StartNew()

$input = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\3\input"

$grabformulas = 'mul\(\d{1,3},\d{1,3}\)'

$grabints = '\d{1,3}'

foreach($value in [regex]::Matches($input, $grabformulas).Value)
{
    [int[]]$curints = [regex]::Matches($value, $grabints).Value

    [int]$total += ($curints[0] * $curints[1])
}

write-host $total -BackgroundColor Green

Write-Host "total time was" $timer.elapsed "seconds"