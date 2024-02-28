$answer = 0
Get-Content '.\input' | ForEach-Object {
    $words = ($_ -replace ':') -split ' '
    $num = [int]$words[1]
    for ($i = 2; $i -lt $words.Count; $i += 2) {
        $value = [int]$words[$i]
        switch ($words[$i+1]) {
            "blue*"  { if ($value -gt 14) { continue } }
            "green*" { if ($value -gt 13) { continue } }
            "red*"   { if ($value -gt 12) { continue } }
        }
        if ($value -gt 15) { continue }
        $answer += $num
        break
    }
}
echo $answer
