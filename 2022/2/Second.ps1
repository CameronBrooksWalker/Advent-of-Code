# A = Rock ; B = Paper ; C = Scissors
# X = Lose ; Y = Draw ; Z = Win
# Rock = 1 ; Paper = 2 ; Scissors = 3
# Loss = 0 ; Draw = 3 ; Win = 6

$infile = Get-Content .\input.txt

foreach ($line in $infile) {
switch ($line) 
{
"A X" {$score += (3+0)}
"A Y" {$score += (1+3)}
"A Z" {$score += (2+6)}
"B X" {$score += (1+0)}
"B Y" {$score += (2+3)}
"B Z" {$score += (3+6)}
"C X" {$score += (2+0)}
"C Y" {$score += (3+3)}
"C Z" {$score += (1+6)}
}
}

echo $score