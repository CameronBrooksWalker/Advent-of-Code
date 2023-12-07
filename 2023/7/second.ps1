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
    
    $ohand = $hand

if(($hand.ToCharArray() | group | sort count -Descending | select -expandProperty Name | select -First 1) -ne "N")
{
    $biggest = $hand.ToCharArray() | group | sort count -Descending | select -expandProperty Name | select -First 1
}
else
{
        $notbiggest = $hand.ToCharArray() | group | sort count -Descending | select -expandProperty Name
        $biggest = $notbiggest[1]
}

$hand = $hand.Replace("N",$biggest)

$result =  $hand.ToCharArray() | group | sort count -Descending | select -expandProperty Count

if($ohand -eq "NNNNN"){$result = (5)}

if($result[0] -eq 5) {$global:5oak += $ohand;}
elseif ($result[0] -eq 4) {$global:4oak += $ohand;}
elseif ($result[0] -eq 3 -and $result[1] -eq 2) {$global:fullhouse += $ohand;}
elseif ($result[0] -eq 3 -and $result[1] -eq 1) {$global:3oak += $ohand;}
elseif ($result[0] -eq 2 -and $result[1] -eq 2) {$global:twopair += $ohand;}
elseif ($result[0] -eq 2) {$global:onepair += $ohand;}
elseif ($result[0] -eq 1) {$global:highcard += $ohand;}


}

function makeusable {
    param (
        [string[]] $inguy
    )

return $inguy.Replace("K","B").Replace("Q","C").Replace("J","N").Replace("T","E").Replace("9","F").Replace("8","G").Replace("7","H").Replace("6","I").Replace("5","J").Replace("4","K").Replace("3","L").Replace("2","M")

    
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
    #echo $hbmatch.($allsorted[$i])
    #echo ($i+1)
    
    $winnings += ([int]$hbmatch.($allsorted[$i]) * ($i+1))
}

echo $winnings
