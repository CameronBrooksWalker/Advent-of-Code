
$infile = Get-Content .\input.txt

for($i=0 ; $i -lt $infile.Length ; $i++)
{
for($j=0 ; $j -lt 13 ; $j++){
    
    if($infile.Substring(($j+1+$i),(13-$j)).Contains($infile[$i+$j]))
    {break}
    elseif($j -eq 12)
    { Write-host -BackgroundColor yellow -ForegroundColor Green ($i+14)}
}
    if($j -eq 13){break}
}