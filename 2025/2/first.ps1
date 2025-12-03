$input = get-content "~\documents\adventofcode\advent-of-code\2025\2\input"

$input = $input -split ','

$answer = 0

foreach($range in $input)
{
    $range = $range -split '-'

    for ($i = [long]$range[0]; $i -lt [long]$range[1]+1; $i++) {

        $stri = [String]$i

        if($stri.length -eq 2)
        {
            if( $stri.Substring(0,1) -like $stri.Substring(1,1))
            {
                $answer += $i
            }
        }
        elseif($stri.Length%2 -eq 0)
        {

            if( $stri.substring(0,($stri.length/2)) -like $stri.Substring($stri.length / 2,($stri.length/2)))
            {
                $answer += $i
            }
        }
    }
}

write-host $answer