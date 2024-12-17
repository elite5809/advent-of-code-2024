# Day 04
$inFile = '.\data\day04.txt'
$data = Get-Content $inFile

$yMax = $data.Count - 1
$xMax = $data[0].Length - 1
$xmasCount = 0
$masCount  = 0

foreach ($y1 in 0..$yMax) {
    foreach ($x1 in 0..$xMax) {
        if ($data[$y1][$x1] -ne 'S') { continue }
        $horizontal     = ''
        $vertical       = ''
        $topDiagonal    = ''
        $botDiagonal    = ''
        foreach ($dY in -3..3) {
            foreach ($dX in -3..3) {
                $y2  = $y1 + $dY
                $y2r = $y1 - $dY
                $x2  = $x1 + $dX
                if ($x2 -ge 0 -and $x2 -le $xMax) {
                    if ($y1  -eq $y2) { $horizontal += $data[$y1][$x2] }
                    if ($y2  -ge 0 -and $y2  -le $yMax -and $dY -eq $dX) { $topDiagonal += $data[$y2 ][$x2] }
                    if ($y2r -ge 0 -and $y2r -le $yMax -and $dY -eq $dX) { $botDiagonal += $data[$y2r][$x2] }
                }
                if ($y2 -ge 0 -and $y2 -le $yMax -and $x1 -eq $x2) { $vertical += $data[$y2][$x1] }
            }
        }
        $str = $horizontal, $vertical, $topDiagonal, $botDiagonal -join '|'
        $xmasCount += [regex]::Matches('(XMAS|SAMX)', $str).Count
        # $masCount  += [regex]::Matches('(MAS|SAM)', $str).Count
    }
}

# Part 1
$xmasCount
# Part 2
# $masCount

# $vert = @()
# for ($i = 0; $i -le $xMax; $i++) {
#     $tmpLine = ""
#     foreach ($line in $data){
#         $tmpLine += $line[$i]
#     }
#     $vert += $tmpLine
# }
# $topL = @()
# for ($i = 0; $i -le $yMax + $xMax; $i++) {
#     $tmpLine = ""
#     for ($j = 0; $j -le [Math]::Min($i, $xMax); $j++) {
#         $y = [Math]::Min($i - $j, $yMax - $j)
#         $x = [Math]::Max(0, $i - $yMax) + $j
#         $tmpLine += $data[$y][$x]
#     }
#     $topL += $tmpLine
# }
# $topR = @()
# for ($i = 0; $i -le $yMax + $xMax; $i++) {
#     $tmpLine = ""
#     for ($j = 0; $j -le [Math]::Min($i, $xMax); $j++) {
#         $y = [Math]::Min($i - $j, $yMax - $j)
#         $x = [Math]::Max(0, $i - $yMax) + ($xMax - $j)
#         $tmpLine += $data[$y][$x]
#     }
#     $topR += $tmpLine
# }

# $valid = $data + $vert + $topL + $topR
# $valid

# Part 1
# [regex]::Matches($valid, '(XMAS|SAMX)').Count + [regex]::Matches($valid, '(XMASAMX)').Count