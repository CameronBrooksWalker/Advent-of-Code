$input = get-content ".\input"
$input = $input

$global:5oak = @()
$global:4oak = @()
$global:3oak = @()
$global:fullhouse = @()
$global:twopair = @()
$global:onepair = @()
$global:highcard = @()


function Hand-Check {
    param (
        [Parameter()]
        [string] $hand
    )
    
$result =  $hand.ToCharArray() | group | sort count -Descending | select -expandProperty Count 

#echo $result


if($result[0] -eq 5) {$global:5oak += $hand;}
elseif ($result[0] -eq 4) {$global:4oak += $hand;}
elseif ($result[0] -eq 3 -and $result[1] -eq 2) {$global:fullhouse += $hand;}
elseif ($result[0] -eq 3 -and $result[1] -eq 1) {$global:3oak += $hand;}
elseif ($result[0] -eq 2 -and $result[1] -eq 2) {$global:twopair += $hand;}
elseif ($result[0] -eq 2) {$global:onepair += $hand;}
elseif ($result[0] -eq 1) {$global:highcard += $hand;}


}

function makeusable {
    param (
        [string[]] $inguy
    )

return $inguy.Replace("K","B").Replace("Q","C").Replace("J","D").Replace("T","E").Replace("9","F").Replace("8","G").Replace("7","H").Replace("6","I").Replace("5","J").Replace("4","K").Replace("3","L").Replace("2","M")

    
}


$hbmatch = @{}
$allsorted = @()
[int]$winnings = 0

foreach ($game in $input)
{

hand-check -hand (makeusable -inguy ($game.substring(0,5)))

$converted = makeusable -inguy ($game.substring(0,5))

$hbmatch[$converted] = $game.substring(6, $game.length-6)

}


$allsorted += ($highcard | sort -Descending)
$allsorted += ($onepair | sort -Descending)
$allsorted += ($twopair | sort -Descending)
$allsorted += ($3oak | sort -Descending)
$allsorted += ($fullhouse | sort -Descending)
$allsorted += ($4oak | sort -Descending)
$allsorted += ($5oak | sort -Descending)


for($i=0; $i -lt $allsorted.count; $i++)
{   
    $winnings += ([int]$hbmatch.($allsorted[$i]) * ($i+1))
}

echo $winnings
