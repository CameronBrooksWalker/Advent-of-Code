

$infile = get-content .\testinput.txt

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

    $tree=[int]::parse($line[$x])


<#if($tree -gt ($hray[0..($x-1)]))
{
    #echo "Visible from left side"
    $total++
}
elseif($tree -gt ($hray[($x+1)..($hray.Count-1)]))
{
    #echo "Visible from the right"
    $total++
}
elseif($tree -gt ($vray[($i+1)..($vray.Count-1)]))
{
    #echo "Visible from the bottom"
    $total++
}
elseif($tree -gt ($vray[0..($i-1)]))
{
    #echo "Visible from the top"
    $total++

}#>

$iter = 0
while($tree -gt ($hray[0..($x-1)])[$iter])
{
$iter++


}

}

}

$i++


}

echo "total is " ((($infile.Count * 2) + (($infile[0].Length-2)*2)) + $total)
