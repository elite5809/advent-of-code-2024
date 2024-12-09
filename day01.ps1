# Day 01
$inFile = '.\data\day01.txt'
$data = Get-Content $inFile

$lists = @(@(), @())
foreach ($line in $data) {
    $nums = $line -split "   "
    $lists[0] += $nums[0]
    $lists[1] += $nums[1]
}
$lists[0] = $lists[0] | Sort-Object
$lists[1] = $lists[1] | Sort-Object

# Part 1
$total = 0
for ($i = 0; $i -lt $lists[0].Count; $i++){
    $total += [Math]::Abs($lists[0][$i] - $lists[1][$i])
}
$total

# Part 2
$total = 0
$groupedList = $lists[1] | Group-Object
foreach ($key in $lists[0]) {
    $total += ([int]$key * ($groupedList | Where-Object Name -eq "$key").Count)
}
$total