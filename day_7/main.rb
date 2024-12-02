# https://adventofcode.com/2024/day/4

require "pry" 

Equation = Struct.new(:result, :operands)

result_1 = File
  .read("input")
  .split("\n")
  .map do |line|
    Equation.new(
      result: line.split(":").first.to_i,
      operands: line.split(":").last.split.map(&:to_i)
    )
  end
  .filter do |equation|
    %i[+ *]
      .repeated_permutation(equation.operands.size - 1)
      .any? do |operators|
        equation.result == equation.operands[1..].each.with_index(1).reduce(equation.operands[0]) do |left, (right, i)|
          left.send(operators[i - 1], right)
        end
      end
  end
  .sum(&:result)

puts "Result 1: #{ result_1 }"

result_2 = File
  .read("input")
  .split("\n")
  .map do |line|
    Equation.new(
      result: line.split(":").first.to_i,
      operands: line.split(":").last.split.map(&:to_i)
    )
  end
  .filter do |equation|
    %i[+ *]
      .repeated_permutation(equation.operands.size - 1)
      .any? do |operators|
        equation.result == equation.operands[1..].each.with_index(1).reduce(equation.operands[0]) do |left, (right, i)|
          left.send(operators[i - 1], right)
        end
      end
  end
  .sum(&:result)

puts "Result 2: #{ result_1 }"