$input = get-content ".\input"


function Check-Card
{
    [CmdletBinding()]
	param(
		[Parameter()]
		[string] $cardtbc
    )

    $matches = 0

    $cardtbc = $cardtbc.substring(($cardtbc.indexof(":")) + 2, $cardtbc.length - $cardtbc.indexof(":") - 2)

    $winners = $cardtbc.substring(0,$cardtbc.indexof("|")-1)

    $winners = $winners.split(" ") | where {$_}

    $havers = $cardtbc.substring($cardtbc.indexof("|")+2,$cardtbc.length - $cardtbc.indexof("|")-2)

    $havers = $havers.split(" ") | where {$_}
    

    foreach($win in $winners)
    {
        if($win -in $havers)
        {
            #if($matches -eq 0){$matches++} else {$matches *= 2}
            $matches++
        }
    }

    return $matches


}


[int[]]$array = @()

for($i =0; $i -lt $input.count ; $i++) {$array += 1}

for ($i = 0; $i -lt $input.Count ; $i++) 
{
    
    $card = $input[$i]
    
    $num = check-card -cardtbc $card
    
    for($k = 0; $k -lt $array[$i]; $k++)
    {
        
        for($j = 1; $j -le $num; $j++)
        {
            $array[$j+$i] += 1 
        }
        
    }

}



echo $array | measure -sum
