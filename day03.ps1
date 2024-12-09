# Day 03
$inFile = '.\data\day03.txt'
$data = Get-Content $inFile

function Get-AllMulOpMatches ($in) {
    $regexMulOp = 'mul\(\d{1,3},\d{1,3}\)'
    $matchesMulOp = [regex]::Matches($in, $regexMulOp)
    $total = 0
    
    # Part 1
    $pairs = $matchesMulOp -replace '(mul|[\(\))])'
    foreach ($pair in $pairs) {
        $pair = $pair -split ',' | ForEach-Object { [int]$_ }
        $total += $pair[0] * $pair[1]
    }
    $total
}

# Part 1
Get-AllMulOpMatches $data
# Part 2
$regexEnabled = "^.*?(?<=don't\(\))|(?=do\(\)).*?(?<=don't\(\))|(?=do\(\)).*?$"
$matchesEnabled = [regex]::Matches($data, $regexEnabled)
Get-AllMulOpMatches $matchesEnabled
# $matchesEnabled