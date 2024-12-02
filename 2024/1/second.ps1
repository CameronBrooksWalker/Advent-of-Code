$timer =  [Diagnostics.Stopwatch]::StartNew()


$input = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\1\input"


[int[]]$list1 = @() #Lists for both groups
[int[]]$list2 = @()

[int[]]$sims = @() #Array of differences in values

foreach($line in $input)
{

$list1 += $line.split()[0] #populate lists
$list2 += $line.split()[3]

}

$hash = ($list2 | group -AsHashTable -AsString) #Group and hash list2 by occurences of values

foreach($val in $list1)
{

$sims += ($val * $hash[[string]$val].Count) #Multiply occurences times each value in list1, and add to sims array

}

Write-Host ($sims | Measure-Object -Sum).sum #print sum of sims array

Write-Host "total time was" $timer.elapsed "seconds"