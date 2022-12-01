

$input = get-content 'c:\users\cwalker\documents\powershell projects\Advent of Code\Day1input.txt'

$stock = @()

foreach ($line in $input) {

if ($line) {$i += $line} else {$stock += $i ; $i = 0}

}

$stock | sort -Descending | select -first 1