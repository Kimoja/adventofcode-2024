# https://adventofcode.com/2024/day/1

lists = File.read("input")
  .split
  .map(&:to_i)
  .partition
  .with_index { _2.even? }

distance = lists
  .yield_self { _1[0].sort.zip(_1[1].sort) }
  .sum { (_1[0] - _1[1]).abs }

puts "Distances: #{ distance }"  

similarity = lists.yield_self { |a| a[0].sum { _1 * a[1].count(_1) } }

puts "Similarity: #{ similarity }"  
  