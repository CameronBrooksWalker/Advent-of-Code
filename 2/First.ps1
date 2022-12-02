# A/X = Rock ; B/Y = Paper ; C/Z = Scissors
# Rock = 1 ; Paper = 2 ; Scissors = 3
# Loss = 0 ; Draw = 3 ; Win = 6

$infile = Get-Content .\input.txt

foreach ($line in $infile) {
switch ($line) 
{
"A X" {$score += (1+3)}
"A Y" {$score += (2+6)}
"A Z" {$score += (3+0)}
"B X" {$score += (1+0)}
"B Y" {$score += (2+3)}
"B Z" {$score += (3+6)}
"C X" {$score += (1+6)}
"C Y" {$score += (2+0)}
"C Z" {$score += (3+3)}
}
}

echo $score

