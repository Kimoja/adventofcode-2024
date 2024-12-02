# https://adventofcode.com/2024/day/3

input = File.read("input")

def evaluate(ex) = ex.scan(/mul\((\d+),(\d+)\)/).map { _1.map(&:to_i).reduce(&:*) }.sum

puts "sum_v1: #{evaluate(input)}"

puts "sum_v2: #{evaluate(input.split("do()").map { _1.split("don't()")[0] }.join)}"
