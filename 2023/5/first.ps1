$input = get-content ".\input"

[long[]]$seeds = $input[0].Substring(7,$input[0].length-7).split(" ")

[long[]]$distance = @()

foreach($sneed in $seeds)
{

$seed = $sneed

$tempkey = $seed

for($i=2; $i -lt $input.count; $i++)
{

$line = $input[$i]


if($line -notlike "*:*")
{

    [long[]]$chart = $line.split(" ")

    if($seed -ge $chart[1] -and $seed -le ($chart[1] + $chart[2]-1))
    {

        $tempkey = ($chart[0] - $chart[1] + $seed)

    }

}
else 
{

    $seed = $tempkey

}


}

$seed = $tempkey

$distance += $seed

}

echo "sorted answer is : "

echo $distance | sort


