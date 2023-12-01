
$input = get-content '.\input'

$input = $input.replace("one","o1e").replace("two","t2o").replace("three","t3e").replace("four","f4r").replace("five","f5e").replace("six","s6x").replace("seven","s7n").replace("eight","e8t").replace("nine","n9e")

$total = 0

foreach ($line in $input) {

$line = $line -replace "\D",""

[int]$total += $line[0] + $line[$line.length-1]

}

echo $total