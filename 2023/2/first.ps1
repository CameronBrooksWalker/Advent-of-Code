$input = get-content '.\input'

$answer = 0

foreach ($game in $input) #cycle through each game
{

$game = $game.replace(':','') #remove colon

$words = $game.Split(" ") #split game into array of words

for ($i =2; $i -le $words.Count; $i+=2) #check each value for possibility
{

$valid = 1

if([int]$words[$i] -gt 15)
{$valid = $false ; break }
elseif ([int]$words[$i] -gt 14 -and $words[$i+1] -like "blue*") 
{$valid = $false ; break }
elseif ([int]$words[$i] -gt 13 -and $words[$i+1] -like "green*")
{$valid = $false ; break }
elseif ([int]$words[$i] -gt 12 -and $words[$i+1] -like "red*")
{$valid = $false ; break }

}

if($valid){ $answer += [int]$words[1] }

}

echo $answer