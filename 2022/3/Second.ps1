
$inline = Get-Content .\input

for ($i = 0; $i -lt $inline.Count; $i+=3) {

$array = $inline[$i].tochararray()

foreach($char in $array){

if($char -cin $inline[$i+1].ToCharArray() -and $char -cin $inline[$i+2].ToCharArray()){

if(([int][char]$char) -gt 97){$sum += ([int][char]$char - 96)} else {$sum += ([int][char]$char - 38)}

break

}}}

echo $sum