$input = get-content "~\documents\adventofcode\advent-of-code\2025\1\input"

$position = 50

$count = 0

$zerohits = 0

foreach($turn in $input)
{

    $distance = [int]$turn.substring(1,$turn.length - 1)

    # write-host $position $turn[0] $distance



    if($turn[0] -eq 'L'){

        $prevposition = $position

        $position -= $distance

        if($position -lt 1)
        {
            $cycles = ($position / 100)

            if($prevposition = 0)
            {
                $cycles -= 1
            }

            write-host $cycles -BackgroundColor yellow

            if($cycles -eq 0){$zerocount++}
            elseif($cycles -lt 0 ){$zerocount += [math]::ceiling([math]::abs($cycles))}

        }

        $position = ($position + 1000)%100


    }
    elseif($turn[0] -eq 'R'){

        $position += $distance

        if($position -gt 99)
        {
            $cycles = ($position / 100)
            
            write-host $cycles -BackgroundColor yellow
            
            if($cycles -le 1){$zerocount++}
            elseif($cycles -gt 1){$zerocount += [math]::floor($cycles)}
        }

        $position = $position % 100

    }


write-host $zerocount

}

write-host $zerocount -BackgroundColor Red
