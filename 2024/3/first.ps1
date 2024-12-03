$timer =  [Diagnostics.Stopwatch]::StartNew()


$input = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\3\testinput"

$regexhell = 'mul\(\d{1,3},\d{1,3}\)'



$vals = [regex]::Matches($input, $regexhell).Value

write-host $vals -BackgroundColor Green



Write-Host "total time was" $timer.elapsed "seconds"