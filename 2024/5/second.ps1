$timer =  [Diagnostics.Stopwatch]::StartNew()

function Main
{
    $infile = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\5\input"
    $rules = $infile | where{$_ -like "*|*"}
    $pages = ($infile | where{$_ -like "*,*"})
    $answer = 0

    foreach($page in $pages)
    {
        $ishappy = $true
        $page = $page.split(',')

        foreach($rule in $rules)
        {
            $rule = $rule.split('|')

            if(($page.IndexOf($rule[1]) -le $page.IndexOf($rule[0])) -and ($rule[0] -in $page) -and ($rule[1] -in $page)){$ishappy = $false}
        }

        if($ishappy)
        {
            #  write-host $page -NoNewline ; write-host " is good"

            $answer += $page[([math]::Floor($page.Length/2))]
        }

    }

    return $answer

}


Main #runs main function... not strictly necessary I guess, just felt more organized in the moment

$timer.stop(); Write-Host "Script ran in:" $timer.elapsed.milliseconds "milliseconds" -BackgroundColor Gray -ForegroundColor Red