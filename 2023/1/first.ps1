
$input = get-content '.\input'

$total = 0

foreach ($line in $input) {

$line = $line -replace "\D",""

[int]$total += $line[0] + $line[$line.length-1]

}

echo $total
