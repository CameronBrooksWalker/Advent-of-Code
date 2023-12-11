$input = Get-Content ".\input"

[long]$ans = 0
[long[]]$anray = @()


function get-diffs {
    param (
        [array] $nums
        )
        
        [int[]]$diffs = @()
        
        for ($i = 1; $i -lt $nums.Count; $i++) 
        {
            echo ($nums[$i] - $nums[$i-1])
        }
        
    }



    foreach($line in $input)
    {
        $steps = $line.split("  ")
    
        #echo $steps
        #get-diffs -nums $steps
        #echo "--------"

        [int[]]$finals = @()

        [int[]]$temp = get-diffs -nums $steps

        $finals += $steps[$steps.Count-1]

        $finals += $temp[$temp.Count-1]

        #while ($temp[$temp.Count-1] -ne 0) {
        while ($temp -ne 0) {

            $temp = get-diffs -nums $temp
            $finals += $temp[$temp.Count-1]
            #write-host $temp
            
        }

        #Write-Host $finals ($finals | measure -sum).Sum
        
        
        $anray += ($finals | measure -Sum).Sum


    }

    echo $anray | measure -Sum #-BackgroundColor Yellow -ForegroundColor Green