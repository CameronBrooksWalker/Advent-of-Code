

$infile = get-content .\testinput.txt

$drive = @{}
$drive.add("/",@{})

$curdir = ""

foreach($line in $infile)
{

    if($line[0] -eq '$')
    {

        if($line.split()[1] -eq 'cd')
            {
                #$curdir = $line.split()[2]
                if($line.split()[2] -ne ".." -and $line.split()[2] -ne "/"<# -and !$drive.($curdir.Substring($curdir.length-1,1)).containskey($line.split()[2])#>)
                {

                    if($curdir -eq "/"){$curdir += $line.split()[2]}
                    else {$curdir += ("/" + $line.split()[2])}
                    
                    

                    #$temphash = @{}
    
                    #$drive.add($line.split()[2],$temphash)

                }
                elseif($line.split()[2] -eq "..") 
                {
                    write-host "Up a directory."

                    $curdir = $curdir.Remove($curdir.lastindexof("/"),2)

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

        echo $curdir
        $temphash = @{}
    
        if($line.split()[0] -eq "dir")
        {
            $drive."/".add($line.split()[1],$temphash)
        }




    }

    #echo $curdir
}

#$thing = "/.d"

$drive."/".d.add("heck",200)

$exp = 'echo $drive."/".d'

iex $exp

#echo $drive
