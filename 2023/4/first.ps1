$input = get-content ".\input"

$points = 0

foreach($card in $input)
{

    $matches = 0

    $card = $card.substring(($card.indexof(":")) + 2, $card.length - $card.indexof(":") - 2)

    $winners = $card.substring(0,$card.indexof("|")-1)

    $winners = $winners.split(" ") | where {$_}

    $havers = $card.substring($card.indexof("|")+2,$card.length - $card.indexof("|")-2)

    $havers = $havers.split(" ") | where {$_}
    

    foreach($win in $winners)
    {
        if($win -in $havers)
        {
            if($matches -eq 0){$matches++} else {$matches *= 2}
        }
    }

    $points += $matches

}

echo "this many points : $points"