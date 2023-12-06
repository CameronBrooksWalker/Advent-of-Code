$timer=  [Diagnostics.Stopwatch]::StartNew()

$input = get-content ".\input"

$time = $input[0].substring(11,$input[0].length-11).Replace(" ","")

$distance = $input[1].substring(11,$input[1].length-11).Replace(" ","")


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



get-variations -time $time -distance $distance

Write-Host "total time was" $timer.elapsed "seconds"
