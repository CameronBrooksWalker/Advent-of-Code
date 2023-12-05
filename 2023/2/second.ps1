$input = Get-Content '.\input'

[int]$answer = 0

foreach ($game in $input) #cycle through each game
{

$game = $game.replace(':',',') #remove colon

$game = $game.replace(';',',')

$words = $game.Split(",") #split game into array of words

[int[]]$red = @()
[int[]]$green = @()
[int[]]$blue = @()

foreach($word in $words)
{
    switch ($word)
    {
        {$_ -like "*red*"} {$word = $word.replace(" ","").replace("red","") ; $red += [int]$word}
        {$_ -like "*green*"} {$word = $word.replace(" ","").replace("green","") ; $green += [int]$word}
        {$_ -like "*blue*"} {$word = $word.replace(" ","").replace("blue","") ; $blue += [int]$word}
    }
}

$power = ($red | measure -Maximum).Maximum * ($green | measure -Maximum).Maximum * ($blue | measure -Maximum).Maximum

$answer += $power

}

echo $answer