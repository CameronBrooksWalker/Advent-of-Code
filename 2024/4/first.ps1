$timer =  [Diagnostics.Stopwatch]::StartNew()

$global:xmastimes = 0

function Main
{
    $infile = Get-Content "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2024\4\input"
    $global:XMAX = $infile[0].Length
    $global:YMAX = $infile.Count

    for ($y = 0; $y -lt $infile.Count; $y++) 
    {
        for ($x = 0; $x -lt $infile[$y].Length; $x++) 
        {
            if($infile[$y][$x] -like "X")
            {
                Check-Directions -file $infile -x $x -y $y
            }
        }
    }
    write-host $global:xmastimes "xmaseses" -ForegroundColor Yellow

}

function Check-Directions {
    param (
        [string[]] $file,
        [int] $x, $y
        )

    #left check
    if($x -ge 3 -and $file[$y][$x-1] -eq 'M' -and $file[$y][$x-2] -eq 'A' -and $file[$y][$x-3] -eq 'S' ) {$global:xmastimes++}

    #right check
    if($x -le ($global:xmax - 3) -and $file[$y][$x+1] -eq 'M' -and $file[$y][$x+2] -eq 'A' -and $file[$y][$x+3] -eq 'S' ) {$global:xmastimes++}

    #up check
    if($y -ge 3 -and $file[$y-1][$x] -eq 'M' -and $file[$y-2][$x] -eq 'A' -and $file[$y-3][$x] -eq 'S' ) {$global:xmastimes++}

    #down check
    if($y -le ($global:ymax - 4) -and $file[$y+1][$x] -eq 'M' -and $file[$y+2][$x] -eq 'A' -and $file[$y+3][$x] -eq 'S' ) {$global:xmastimes++}

    #up left check
    if($y -ge 3 -and $x -ge 3 -and $file[$y-1][$x-1] -eq 'M' -and $file[$y-2][$x-2] -eq 'A' -and $file[$y-3][$x-3] -eq 'S') {$global:xmastimes++}

    #up right check
    if($y -ge 3 -and $x -le ($global:xmax - 4) -and $file[$y-1][$x+1] -eq 'M' -and $file[$y-2][$x+2] -eq 'A' -and $file[$y-3][$x+3] -eq 'S') {$global:xmastimes++}

    #down right check
    if($y -le ($global:YMAX - 4) -and $x -le ($global:XMAX - 4) -and $file[$y+1][$x+1] -eq 'M' -and $file[$y+2][$x+2] -eq 'A' -and $file[$y+3][$x+3] -eq 'S') {$global:xmastimes++}

    #down left check
    if($y -le ($global:YMAX - 4) -and $x -ge 3 -and $file[$y+1][$x-1] -eq 'M' -and $file[$y+2][$x-2] -eq 'A' -and $file[$y+3][$x-3] -eq 'S') {$global:xmastimes++}
}

Main #runs main function... not strictly necessary I guess, just felt more organized in the moment

$timer.stop(); Write-Host "Script ran in:" $timer.elapsed.seconds "seconds or" $timer.elapsed.milliseconds "milliseconds" -BackgroundColor Gray -ForegroundColor Red