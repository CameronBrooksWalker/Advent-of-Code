$infile = Get-Content .\input.txt

for ($i = 1; $i -lt $infile.Count+1; $i++) {if ([int]$infile[$i] -gt [int]$infile[$i-1]) {$num++}}

echo $num