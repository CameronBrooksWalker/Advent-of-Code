

$infile = get-content .\input.txt

$drive = @{}

$curdir = ""

foreach($line in $infile)
{

    if($line[0] -eq '$')
    {

        if($line.split()[1] -eq 'cd')
            {
                
                if($line.split()[2] -ne ".." -and $line.split()[2] -ne "/")
                {

                    if($curdir -eq "/"){$curdir += $line.split()[2]}
                    else {$curdir += ("/" + $line.split()[2])}
                    

                }
                elseif($line.split()[2] -eq "..") 
                {

                    $curdir = $curdir.Remove($curdir.lastindexof("/"),($curdir.Length - $curdir.lastindexof("/")))

                    if(!$curdir){$curdir = "/"}
                }
                elseif($line.split()[2] -eq "/")
                {
                    $curdir = "/"
                }


            }
            elseif ($line.split()[1] -eq 'ls') 
            {

            }

    }
    else
    {
        $tempstring = $curdir.Remove($curdir.lastindexof("/"),($curdir.Length - $curdir.lastindexof("/")))
        

        if($line.split()[0] -ne "dir" -and !$drive.ContainsKey($curdir))
        {
            $drive.add($curdir,[int]$line.split()[0])

            while($tempstring)
            {
                $drive[$tempstring] += [int]$line.split()[0]

                $tempstring = $tempstring.Remove($tempstring.lastindexof("/"),($tempstring.Length - $tempstring.lastindexof("/")))
            }
            if($curdir -ne "/") {$drive["/"] += [int]$line.split()[0]}
            
        }
        elseif($line.split()[0] -ne "dir" -and $drive.ContainsKey($curdir))
        {
            $drive[$curdir] += [int]$line.split()[0]

            while($tempstring)
            {
                $drive[$tempstring] += [int]$line.split()[0]

                $tempstring = $tempstring.Remove($tempstring.lastindexof("/"),($tempstring.Length - $tempstring.lastindexof("/")))
            }
            if($curdir -ne "/") {$drive["/"] += [int]$line.split()[0]}

        }

    }

}

#echo $drive

$unused = 70000000 - $drive["/"]

$needed = 30000000 - $unused

$thing = $drive.Values | where {$_ -gt $needed} | sort 

echo $thing[0]