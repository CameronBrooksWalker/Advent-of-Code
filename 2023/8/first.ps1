$input = get-content ".\input"

$turns = $input[0].ToCharArray()

$input = $input[2..($input.Count)]

$map = @{}

$currentnode = "AAA"

$total = 0

foreach($inny in $input)
{

$map.Add($inny.substring(0,3),($inny.substring(7,4) + $inny.substring(12,3)))

}

for ($i = 0; $i -lt $turns.Count; $i++) {

    $total++
    
    switch ($turns[$i]) {
        "R" {$currentnode = $map.$currentnode.split(",")[1]}
        "L" {$currentnode = $map.$currentnode.split(",")[0]}
    }

if($currentnode -eq "ZZZ"){break}

if($i -eq ($turns.Count -1)){$i = -1}

}

echo $total