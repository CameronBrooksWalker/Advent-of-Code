$timer =  [Diagnostics.Stopwatch]::StartNew()


$input = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\1\input"


[int[]]$list1 = @() #Lists for both groups
[int[]]$list2 = @()

[int[]]$diffs = @() #Array of differences in values

foreach($line in $input)
{

$list1 += $line.split()[0] #populate lists
$list2 += $line.split()[3]

}

$list1 = $list1 | sort #sort lists
$list2 = $list2 | sort


for ($i = 0; $i -lt $list1.Count; $i++) {$diffs += [Math]::Abs($list1[$i] - $list2[$i])} #add absolute value of differences to diff array

Write-Host ($diffs | Measure-Object -Sum).sum #print sum of diff array

Write-Host "total time was" $timer.elapsed "seconds"