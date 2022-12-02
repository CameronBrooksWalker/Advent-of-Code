$infile = Get-Content .\input.txt

for ($i = 1; $i -lt $infile.Count-2; $i++) {if ([int]$infile[$i] + [int]$infile[$i+1] + [int]$infile[$i+2] -gt [int]$infile[$i-1] + [int]$infile[$i] + [int]$infile[$i+1]) {$num++}}

echo $num
