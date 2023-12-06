$input = get-content ".\input"

[int[]]$times = $input[0].Substring(11,$input[0].Length-11).split(" ") | where {$_ -notlike ""}

[int[]]$distances = $input[1].substring(11,$input[1].length-11).Split(" ") | where {$_ -notlike ""}

$margin = 1

function get-variations
{
    [CmdletBinding()]
	param(
		[Parameter()]
		[int] $time, $distance
    )


    [int]$winningvariations = 0

    for($i=0; $i -lt ($time-1); $i++)
    {

        if(($time-$i)*$i -gt $distance)
        {
            $winningvariations++
        }

    }

    return [int]$winningvariations

}


for($j=0; $j -lt $times.Count; $j++)
{
    get-variations -time $times[$j] -distance $distances[$j]

    $margin *= get-variations -time $times[$j] -distance $distances[$j]

}

echo "margin of error is : $margin"