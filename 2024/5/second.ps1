$timer =  [Diagnostics.Stopwatch]::StartNew()

function Main
{
    $infile = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\5\input"
    $global:rules = $infile | where{$_ -like "*|*"}
    $pages = ($infile | where{$_ -like "*,*"})
    $answer = 0







    $allpages = New-Object System.Collections.Generic.List[System.Object]


    foreach($item in ($global:rules.split('|') | sort -Unique))
    {
        $allpages.add($item)
    }

    write-host "All: $allpages"

    $lowrules = New-Object System.Collections.Generic.List[System.Object]
    $highrules = New-Object System.Collections.Generic.List[System.Object]

    foreach($rule in $global:rules)
    {
        $lowrules.add($rule.split('|')[0])
        $highrules.add($rule.split('|')[1])
    }

    # write-output ($lowrules |sort -unique).Count
    # write-output ($highrules |sort -unique).Count
    # write-output $allpages.Count

    $lowht = ($lowrules | group -AsHashTable -AsString)

    for ($i = 0; $i -lt $allpages.Count; $i++) {

            # write-output $allpages[$i] "is being checked"
            write-output "Run $i"
            write-output $lowht[$allpages[$i]]
            # write-output $lowht[$val].Count
        
    }



    compare ($lowrules | sort -unique) ($highrules | sort -Unique)










    
}



function follow-rules {
    param (
        [string[]]$tobechecked
    )

    $ishappy = $true
    write-host $tobechecked -BackgroundColor Yellow
    
    foreach($rule in $global:rules)
    {
        $rule = $rule.split('|')

        if(($tobechecked.IndexOf($rule[1]) -le $tobechecked.IndexOf($rule[0])) -and ($rule[0] -in $tobechecked) -and ($rule[1] -in $tobechecked))
        {
            $ishappy = $false
            # write-host $rule[1] is less than $rule[0]  -ForegroundColor Red
        }
    }

    return $ishappy
}


Main #runs main function... not strictly necessary I guess, just felt more organized in the moment

# $global:outsidey

$timer.stop(); Write-Host "Script ran in:" $timer.elapsed.milliseconds "milliseconds" -BackgroundColor Gray -ForegroundColor Red
