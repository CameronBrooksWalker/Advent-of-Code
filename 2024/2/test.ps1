

$nums = 1,2,3,4,5

$nums[1] = $null

$nums = $nums | where {$_ -ne $null}

write-host $nums
