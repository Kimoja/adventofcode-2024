# https://adventofcode.com/2024/day/3

input = File.read("input")

puts "sum_v1: #{input.scan(/mul\((\d+),(\d+)\)/).map { _1.map(&:to_i).reduce(&:*) }.sum}"

puts "sum_v2: #{input.scan(/(\A.*?don't)|.*?(do\(\).*?don't\(\)|\Z)/m).flatten.join.scan(/mul\((\d+),(\d+)\)/).map{_1.map(&:to_i).reduce(&:*)}.sum}"
