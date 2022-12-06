

$infile = get-content .\input.txt

$stacks = $infile.where({!$_},'Until')

$instructions = $infile.where({!$_},'SkipUntil')

$stacount = ((($stacks[0].length)+1)/4)

$array = @($null) * ($stacks.Count - 1)

$z=0

#create stack array
for($y=($stacks.count -2 ) ; $y -gt -1 ; $y-=1)
{

    for($x=1 ; $x -lt $stacks[$y].length ; $x+=4){

        $array[$z] += $stacks[$y][$x]

    }
$z++

}


#invert stack array
$array2 = @($null) * $stacount

for($f=0 ; $f -lt $array.Count ; $f++)
{

for($h=0 ; $h -lt $stacount ; $h++)
{
    if($array[$f][$h] -ne ' '){

        $array2[$h] += $array[$f][$h]
    }
}

}

#perform instructions
foreach($inst in $instructions)
{
$inst = $inst.split()


if($inst){

   $array2[$inst[5]-1] += $array2[($inst[3]-1)].substring(($array2[($inst[3]-1)].length)-$inst[1],$inst[1])

   $array2[$inst[3]-1] = $array2[$inst[3]-1].remove(($array2[($inst[3]-1)].length)-$inst[1],$inst[1])

}

}

echo "Final is : " $array2


