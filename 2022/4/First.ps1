
$infile = Get-Content .\input

foreach($line in $infile){

$line = $line.split(",")

$first = $line[0].split("-")

$second = $line[1].split("-")

if((compare -ReferenceObject ([int]$first[0]..[int]$first[1]) -DifferenceObject ([int]$second[0]..[int]$second[1]) -IncludeEqual).sideindicator -notcontains "=>" -or (compare -ReferenceObject ([int]$first[0]..[int]$first[1]) -DifferenceObject ([int]$second[0]..[int]$second[1]) -IncludeEqual).sideindicator -notcontains "<=")
{

$answer++

}

}

echo $answer