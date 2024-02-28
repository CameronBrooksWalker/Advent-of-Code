$timer = [Diagnostics.Stopwatch]::StartNew()

# Efficient File Reading
$reader = [System.IO.StreamReader] "C:\users\cwalker\Documents\AdventOfCode\Advent-of-Code\2023\6\input"
$timeLine = $reader.ReadLine()
$distanceLine = $reader.ReadLine()
$reader.Close()

# Corrected String Manipulation
# Extracting full numeric part after 'Time=' and 'Distance='
$time = [int]($timeLine -replace '.*Time=', '')
$distance = [int]($distanceLine -replace '.*Distance=', '')

function Get-Variations {
    param(
        [int] $time, 
        [int] $distance
    )

    [int] $winningVariations = 0

    # Loop for calculation
    for ($i = 0; $i -lt $time; $i++) {
        if (($time - $i) * $i -gt $distance) {
            $winningVariations++
        }
    }

    return [int] $winningVariations
}

# Execution
$variations = Get-Variations -time $time -distance $distance
Write-Host "Winning Variations: $variations"
Write-Host "Total time was $($timer.Elapsed.TotalSeconds) seconds"

$timer.Stop()
