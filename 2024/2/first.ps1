$timer =  [Diagnostics.Stopwatch]::StartNew()


$input = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\2\input"

[int]$safecount = 0



foreach($line in $input)
{

[int[]]$nums = $line.split() #split values into integer array

[bool]$direction = 0 #set bool for checking if increasing or decreasing

if($nums[1] - $nums[0] -gt 0){$direction = 1} #if increasing, make direction bool true

[bool]$safe = 1


for ($i = 0; $i -lt $nums.Count-1; $i++) 
{
    
$change = $nums[$i+1] - $nums[$i] #calculate change

if($direction)
{
    if($change -le 0 -or $change -ge 4){$safe = 0}
}
else 
{
    if($change -ge 0 -or $change -le -4){$safe = 0}
    
}

}


if($safe){$safecount++}


}


Write-Host $safecount






Write-Host "total time was" $timer.elapsed "seconds"