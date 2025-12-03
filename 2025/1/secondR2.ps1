$input = get-content "~\documents\adventofcode\advent-of-code\2025\1\input"

$position = 50

$zerocount = 0

foreach($turn in $input)
{

    $distance = [int]$turn.substring(1,$turn.length - 1)

    if($turn[0] -eq 'L'){

        for ($i = 0; $i -lt $distance; $i++) {
            
            $position--
            if($position -eq -1){$position = 99}
            if($position -eq 0){$zerocount++}

        }

    }
    elseif($turn[0] -eq 'R'){

        for ($i = 0; $i -lt $distance; $i++) {
            
            $position++
            if($position -eq 100){$position = 0}
            if($position -eq 0){$zerocount++}

        }
    }
}

write-host $zerocount -BackgroundColor Red
