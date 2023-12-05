$input = get-content ".\input"

[long[]]$ranges = $input[0].Substring(7,$input[0].length-7).split(" ")

[long[]]$seeds = @()

[long[]]$distance = @()

echo "Calculating ranges... and pain..."

for($j=0; $j -lt ($ranges.count); $j+=2)
{

echo "Range $j"

for($k=0; $k -lt $ranges[$j+1]; $k++)
{
    $seeds += ($ranges[$j] + $k)
}



}

echo "Done calculating... owie, my brain"


foreach($sneed in $seeds)
{

$seed = $sneed

#echo "seed is $seed"

$tempkey = $seed

for($i=2; $i -lt $input.count; $i++)
{

$line = $input[$i]


if($line -notlike "*:*")
{

    [long[]]$chart = $line.split(" ")

    if($seed -ge $chart[1] -and $seed -le ($chart[1] + $chart[2] -1))
    {

        #write-host $seed is between $chart[1] and ($chart[1] + $chart[2])
        $tempkey = ($chart[0] - $chart[1] + $seed)

    }

}
else 
{

    $seed = $tempkey

}


}

$seed = $tempkey

#echo "location is :  $seed "

$distance += $seed

}

<#echo "----------"
echo "All seeds are : "
echo " "
echo $seeds
echo "----------"

#echo $seeds
echo " "
echo " "#>
echo "sorted answer is : "

echo $distance | sort | select -first 5


