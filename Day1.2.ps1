

$input = get-content 'c:\users\cwalker\documents\powershell projects\Advent of Code\Day1input.txt'

$stock = @()

foreach ($line in $input) {

if ($line) {$i += $line} else {$stock += $i ; $i = 0}

}

$snackers = $stock | sort -Descending | select -first 3

foreach ($snacker in $snackers) {$total += $snacker}

echo $total