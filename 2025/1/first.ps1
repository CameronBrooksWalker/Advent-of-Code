$input = get-content "~\documents\adventofcode\advent-of-code\2025\1\input"

$position = 50

$count = 0

foreach($turn in $input)
{

    switch ($turn[0]) {
        'L' {$position -= [int]$turn.substring(1,$turn.length - 1); $position = ($position + 1000)%100}
        'R' {$position += [int]$turn.substring(1,$turn.length - 1); $position = $position % 100}
    }

    if($position -eq 0){$count++}
}

write-host $count