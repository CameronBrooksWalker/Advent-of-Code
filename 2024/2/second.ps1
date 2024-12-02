
$timer =  [Diagnostics.Stopwatch]::StartNew()

function check-safety {
    param (
        $list = @()
    )
    


[bool]$direction = 0 #set bool for checking if increasing or decreasing
if($list[1] - $list[0] -gt 0){$direction = 1} #if increasing, make direction bool true

[bool]$safe = 1


for ($i = 0; $i -lt $list.Count-1; $i++) 
{
    
$change = $list[$i+1] - $list[$i] #calculate change


if($direction)
{
    if($change -le 0 -or $change -ge 4){$safe = 0}
}
else 
{
    if($change -ge 0 -or $change -le -4){$safe = 0}
    
}

}

return $safe

}








$input = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\2\input"

[int]$safecount = 0


foreach($line in $input)
{

$nums = $line.split() #split values into integer array


if(check-safety -list $nums) {$safecount++}
else{

for ($i = 0; $i -lt $nums.Count; $i++) {

    $newnums = [System.Collections.ArrayList]$nums

    $newnums.RemoveAt($i)

    if(check-safety -list $newnums){$safecount++;break}
    
}

 
}
}




Write-Host $safecount


Write-Host "total time was" $timer.elapsed "seconds"