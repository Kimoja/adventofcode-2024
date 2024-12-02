# https://adventofcode.com/2024/day/4

m = File.read("input").split
w = m[0].size
h = m.size

f = %w[XMAS SAMX]
r = m.size.times.sum { |i|
  m[0].size.times.sum { |j|
    (j < w - 3 ? f.include?(m[i][j..j + 3]) ? 1 : 0 : 0) + 
    (i < h - 3 ? f.include?(m[i][j] + m[i + 1][j] + m[i + 2][j] + m[i + 3][j]) ? 1 : 0 : 0) +
    (i < h - 3 && j < w - 3 ? f.include?(m[i][j] + m[i + 1][j + 1] + m[i + 2][j + 2] + m[i + 3][j + 3]) ? 1 : 0 : 0) +
    (i < h - 3 && j > 2 ? f.include?(m[i][j] + m[i + 1][j - 1] + m[i + 2][j - 2] + m[i + 3][j - 3]) ? 1 : 0 : 0)
  }
}

puts "Number of XMAS occurrences: #{ r }"

f = %w[MAS SAM]
r = (m.size - 2).times.sum { |i|
  (m[0].size- 2).times.sum { |j|
    (f.include?(m[i][j] + m[i + 1][j + 1] + m[i + 2][j + 2]) ? 1 : 0) *
      (f.include?(m[i + 2][j] + m[i + 1][j + 1] + m[i][j + 2]) ? 1 : 0 )
  }
}

puts "Number of X-MAS occurrences: #{ r }"
