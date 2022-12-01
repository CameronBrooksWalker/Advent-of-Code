
$input = get-content '.\1\input.txt'

$stock = @()

foreach ($line in $input) {

if ($line) {$i += $line} else {$stock += $i ; $i = 0}

}

($stock | sort -Descending | select -first 3 | Measure-Object -Sum).Sum