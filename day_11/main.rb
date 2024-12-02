# https://adventofcode.com/2024/day/4

require "pry" 

def blink_cache(stone, counter, iteration, max_iteration, cache)
  if cache[stone] && cache[stone][max_iteration - iteration]
    counter[:pointer] += cache[stone][max_iteration - iteration]
    return 
  end
  
  cache_counter = counter[:pointer]

  blink(stone, counter, iteration, max_iteration, cache)

  cache[stone] ||= {}
  cache[stone][max_iteration - iteration] = counter[:pointer] - cache_counter
end

def blink(stone, counter, iteration, max_iteration, cache)
  return if iteration == max_iteration
  iteration += 1

  return blink_cache(1, counter, iteration, max_iteration, cache) if stone == 0
  
  str_stone = stone.to_s
  return blink_cache(stone * 2024, counter, iteration, max_iteration, cache) unless str_stone.size % 2 == 0

  counter[:pointer] += 1

  split_stone_1  = str_stone[..str_stone.size / 2 - 1]
  blink_cache(split_stone_1.to_i, counter, iteration, max_iteration, cache)

  split_stone_2  = str_stone[str_stone.size / 2..]
  blink_cache(split_stone_2.to_i, counter, iteration, max_iteration, cache)
end

stones = File.read("input").split.map(&:to_i)
cache = {}

counter = { pointer: stones.size }
stones.each { blink(_1, counter, 0, 25, {}) }

puts "Part 1: #{ counter[:pointer] }"

t = Time.now
counter = { pointer: stones.size }
stones.each { blink(_1, counter, 0, 75, {}) }
pp Time.now - t

puts "Part 2: #{ counter[:pointer] }"
