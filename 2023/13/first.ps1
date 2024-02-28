$input = get-content .\horinput


function check-vert {
    param (
        [array] $checker
        )

        [bool]$happy = $false
        
        
        for ($i = 0; $i -lt $checker[0].Length-1; $i++) { #for every vertical line
           
            if((Compare-Object ($checker[0..($checker.Count)].substring($i,1)) ($checker[0..($checker.Count)].substring(($i+1),1)) -SyncWindow 0) -eq $null) #if vertical line matches next vertical line
            {
                

                if(($i+1) -gt ($checker[0].Length / 2)) #if mirror location leaves less lines on the right
                {
                    for ($j = $i+3; $j -lt $checker[0].Length+1; $j++) { #iterate through lines on right side of mirror

                        if((Compare-Object ($checker[0..($checker.Count)].substring($j-1,1)) ($checker[0..($checker.Count)].substring($checker[0].Length-($j)+1,1)) -SyncWindow 0) -eq $null) #compare each line to the mirrored line
                        {
                            $happy = $true
                        }
                        else {
                            #echo "No dice."
                            $happy = $false
                            break
                        }

                    }

                    if($happy -eq $true) {return ($i+1)}
                   
                }
                else { #if mirror location leaves less lines on left

                    for ($j = 0; $j -lt $i; $j++) {

                        if((Compare-Object ($checker[0..($checker.Count)].substring($j,1)) ($checker[0..($checker.Count)].substring((($i*2)+1)-$j,1)) -SyncWindow 0) -eq $null)
                        {
                            $happy = $true
                        }
                        else {
                            #echo "No dice."
                            $happy = $false
                            break
                        }

                    }

                    if($happy -eq $true) {return ($i+1)}
                }
            
            
            
            }

        }

        return $happy

    }
    
    
    
    
    
    function check-horiz {
        param (
            [array] $checker
            )
            
            [bool]$happy = false

            for ($i = 0; $i -lt $checker.Count-1; $i++) {
                
                if($checker[$i] -eq $checker[$i+1])
                {

                }


            }
            
            
            
            
            
        }




check-vert -checker $input