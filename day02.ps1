# Day 02 Part 1
$inFile = '.\data\day02.txt'
$data = Get-Content $inFile
$total = 0
$damp = 0

function Test-Continuity ($nums, [switch]$strict) {
    $safe = $true
    $inc = $null
    foreach ($i in 0..($nums.Count - 2)){
        $diff = $nums[$i + 1] - $nums[$i]
        if ($null -eq $inc) { $inc = $diff -gt 0 }

        if (($inc -and ($diff -le 0 -or $diff -ge 4)) -or (!$inc -and ($diff -ge 0 -or $diff -le -4)))
        {
            $safe = $false
            if ($strict) { break }
            if ($i -ne 0) { $i - 1 }
            $i
            $i + 1
        }
    }
    return $safe
}

foreach ($line in $data) {
    $nums = @($line -split " " | ForEach-Object { [int]$_ })
    $results = Test-Continuity $nums
    
    # Part 1
    if ($results[-1]) { $total += 1; continue }

    # Part 2
    $indices = $results | Select-Object -SkipLast 1 | Get-Unique
    foreach ($index in $indices) {
        $tmp = $nums | Select-Object -SkipIndex $index
        if (Test-Continuity $tmp -strict) { $damp += 1; break }
    }
}
$total
$total + $damp