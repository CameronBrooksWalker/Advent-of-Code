$input = get-content ".\input"

$alltimer =  [Diagnostics.Stopwatch]::StartNew()

$global:turns = $input[0].ToCharArray()

$input = $input[2..($input.Count)]

$global:map = @{}

[int[]]$totals = @()

$starters = $input | where {$_[2] -EQ "A"}

$starters = $starters.Substring(0,3)

[int[]]$firsts = @()

Write-Host "After variables and stuff" $alltimer.elapsed "seconds"

foreach($inny in $input)
{
    
    $map.Add($inny.substring(0,3),@($inny.substring(7,3),$inny.substring(12,3)))

    #echo $map
    
}

Write-Host "after making the map" $alltimer.elapsed "seconds"

function find-first {
    param (
        [string] $starguy
        )
        
        $total = 0
        
        for ($i = 0; $i -lt $turns.Count; $i++) {
            
            $total++
            
            switch ($turns[$i]) {
                "R" {$starguy = $map.$starguy[1]}
                #"R" {$starguy = $map.$starguy.split(",")[1]}
                "L" {$starguy = $map.$starguy[0]}
                #"L" {$starguy = $map.$starguy.split(",")[0]}
            }

            #Write-Host "after switch turn $i" $alltimer.elapsed "seconds"
            
            if($starguy.Substring(2,1) -eq "Z"){return $total}
            
            if($i -eq ($turns.Count -1)){$i = -1}
        }
    }
    
    function Get-LCM {
        param (
            [int[]]$numbers
            )
            
            # Function to calculate the greatest common divisor (GCD)
            function Get-GCD($a, $b) {
                while ($b -ne 0) {
                    $temp = $b
                    $b = $a % $b
                    $a = $temp
                }
                return $a
            }
            
            # Function to calculate the LCM
            function Get-LCM-Of-Two($a, $b) {
                return [math]::abs($a * $b) / (Get-GCD $a $b)
            }
            
            # Main calculation
            $lcm = 1
            foreach ($number in $numbers) {
                $lcm = Get-LCM-Of-Two $lcm $number
            }
            
            return $lcm
        }
        
            
            for ($n = 0; $n -lt $starters.Count; $n++) 
            {
                
                $thisfirst = find-first -starguy $starters[$n]
                
                $firsts += $thisfirst

                Write-Host "after the $n starter" $alltimer.elapsed "seconds"
                
                #echo $thisfirst
                
            }

            echo $firsts
            
            get-lcm -numbers $firsts
            
            Write-Host "total time was" $alltimer.elapsed "seconds"