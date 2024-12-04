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
            if($infile[$y][$x] -eq 'A')
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

    if($y -ge 1 -and $y -le ($global:YMAX - 2) -and $x -ge 1 -and $x -le ($global:XMAX -2)) #Check for safe beginning position
    {

        $letters1 = $file[$y-1][$x-1], $file[$y+1][$x+1] #diagonal letters top left and bottom right
        $letters2 = $file[$y+1][$x-1], $file[$y-1][$x+1] #diagonal letters bottom left and top right

        if((Compare-Object ('M','S') $letters1) -eq $null -and (Compare-Object ('M','S') $letters2) -eq $null)
        {$global:xmastimes++}
    }
}

Main #runs main function... not strictly necessary I guess, just felt more organized in the moment

$timer.stop(); Write-Host "Script ran in:" $timer.elapsed.seconds "seconds or" $timer.elapsed.milliseconds "milliseconds" -BackgroundColor Gray -ForegroundColor Red