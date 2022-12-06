
$infile = Get-Content .\input.txt

for($i=0 ; $i -lt $infile.Length ; $i++)
{
for($j=0 ; $j -lt 3 ; $j++){
    
    if($infile.Substring(($j+1+$i),(3-$j)).Contains($infile[$i+$j]))
    {
        break
    }
    elseif($j -eq 2)
    {Write-host -BackgroundColor yellow -ForegroundColor Green ($i+4)}
}
    if($j -eq 3){break}
}



<#for($i=0 ; $i -lt $infile.Length ; $i++)
{
if($infile[$i] -ne $infile[$i+1] -and $infile[$i] -ne $infile[$i+2] -and $infile[$i] -ne $infile[$i+3])
{
    if($infile[$i+1] -ne $infile[$i+2] -and $infile[$i+1] -ne $infile[$i+3])
    {
        if($infile[$i+2] -ne $infile[$i+3])
        {
            echo ($i+4) ; break
        }
    }
}
}#>
