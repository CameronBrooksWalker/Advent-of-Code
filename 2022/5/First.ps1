
$infile = get-content .\input.txt

$stacks = $infile.where({!$_},'Until')

$instructions = $infile.where({!$_},'SkipUntil')

$stacount = ((($stacks[0].length)+1)/4)

$array = @($null) * ($stacount)

$z=0

for($x=1 ; $x -lt $stacks[0].length ; $x+=4){

    for($y=0 ; $y -lt ($stacks.count-1) ; $y++){

    if($stacks[$y][$x] -ne ' ')
    {

    $array[$z] = ($stacks[$y][$x] + $array[$z])

    }
        
    }
    $z++
    }

#perform instructions
foreach($inst in $instructions)
{
$inst = $inst.split()

for($i=0 ; $i -lt $inst[1] ; $i++)
{

$array[$inst[5]-1] += $array[($inst[3]-1)][($array[$inst[3]-1].length -1)]

$array[$inst[3]-1] = $array[$inst[3]-1].remove(($array[$inst[3]-1].length)-1,1)

}

}

echo "Final is : " $array


