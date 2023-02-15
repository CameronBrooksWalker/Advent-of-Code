

$infile = get-content .\input.txt

$i = 0

$total = 0

foreach($line in $infile)
{

if($i -ne 0 -and $i -ne ($infile.count-1))
{

    [array]$hray = foreach($val in $line[0..$line.Length]){[int]::parse($val)}

for($x=1 ; $x -lt ($line.length -1) ; $x++)
{

    [array]$vray = foreach($val in $infile){[int]::parse($val[$x])}


if([int]::parse($line[$x]) -gt ($hray[0..($x-1)] | Measure-Object -Maximum).Maximum)
{
    #echo "Visible from left side"
    $total++
}
elseif([int]::parse($line[$x]) -gt ($hray[($x+1)..($hray.Count-1)] | Measure-Object -Maximum).Maximum)
{
    #echo "Visible from the right"
    $total++
}
elseif([int]::parse($line[$x]) -gt ($vray[($i+1)..($vray.Count-1)] | Measure-Object -Maximum).Maximum)
{
    #echo "Visible from the bottom"
    $total++
}
elseif([int]::parse($line[$x]) -gt ($vray[0..($i-1)] | Measure-Object -Maximum).Maximum)
{
    #echo "Visible from the top"
    $total++

}
}

}

$i++


}

echo "total is " ((($infile.Count * 2) + (($infile[0].Length-2)*2)) + $total)
