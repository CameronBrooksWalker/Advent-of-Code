

$infile = get-content .\testinput.txt

$infile[0..-1][0] | group | sort -Property Count -Descending

