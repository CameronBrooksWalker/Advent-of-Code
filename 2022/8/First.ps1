

$infile = get-content .\testinput.txt

$i = 0

$total = 0

foreach($line in $infile)
{

if($i -ne 0 -and $i -ne ($infile.count-1))
{

for($x=1 ; $x -lt ($line.length -1) ; $x++)
{

    $thingy = @($line[0..$x])



    write-host "Comparing : " $line[$x] "with " $line[0..($x-1)] " and" $line[($x+1)..($line.length-1)]
#if($line[$x] -gt $infile[$i-1][$x] -and $line[$x] -gt $line[$x-1] -and $infile[$x] -gt $line[$x+1] -and $line[$x] -gt $infile[$i+1][$x])
#if($line[$x] -lt $line[0..$x] -and $line[$x] -lt $line[$x..($line.length-1)] )
foreach[$val in $line[]]
{
    foreach($additional in $infile)
    {

        if($line -ne $additional -and $line[$x] -lt $additional[$x])
        {
            break
        }

    }
}
else 
{
    echo $line[$x]
    $total++
}



}

}

$i++


}

echo "total is $total"