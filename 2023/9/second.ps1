$input = Get-Content ".\input"

[long]$ans = 0

function get-diffs {
    param (
        [array] $nums
        )
        
        [int[]]$diffs = @()
        
        for ($i = 1; $i -lt $nums.Count; $i++) 
        {
            $diffs += ($nums[$i] - $nums[$i-1])
        }

        return $diffs
        
    }



    foreach($line in $input)
    {
        $steps = $line.split("  ")

        [array]::Reverse($steps)

        [int[]]$finals = @()

        [int[]]$temp = get-diffs -nums $steps

        $finals += $steps[$steps.Count-1]

        $finals += $temp[$temp.Count-1]

        while ($temp -ne 0) {

            $temp = get-diffs -nums $temp
            $finals += $temp[$temp.Count-1]
            
        }
        
        $ans += ($finals | measure -Sum).Sum

    }

    Write-Host $ans -BackgroundColor Yellow -ForegroundColor Green