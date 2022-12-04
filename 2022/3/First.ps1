
$inline = Get-Content .\input

foreach($line in $inline){

$array = $line.tochararray()

for ($i = 0; $i -lt ($array.Count / 2); $i++) {
    
if($array[$i] -cin $array[($array.count / 2)..$array.count]){

if(([int][char]$array[$i]) -gt 97){
    $sum += ([int][char]$array[$i] - 96)
}
else {
    $sum += ([int][char]$array[$i] - 38)
}

break

}}}

echo $sum