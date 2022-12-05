

$infile = get-content .\testinput.txt

$stacks = $infile.where({!$_},'Until')

$instructions = $infile.where({!$_},'SkipUntil')

$stacount = ((($stacks[0].length)-2)/3)

$array = @($null) * $stacount

$z=0

for($y=($stacks.count -2 ) ; $y -gt -1 ; $y-=1)
{

    for($x=1 ; $x -lt $stacks[$y].length ; $x+=4){

        $array[$z] += $stacks[$y][$x]

    }
$z++

}

echo $array[0][0]
