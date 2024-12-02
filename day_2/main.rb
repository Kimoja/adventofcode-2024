# https://adventofcode.com/2024/day/2

lines = File.readlines("input").map { _1.split.map(&:to_i) }

def check(l) 
  l.each_cons(2)
    .with_index
    .with_object({ ok: true, i: nil, dir: nil }) { |((a, b), i), o|
      n = b - a
      o[:dir] = n > 0 if o[:dir].nil?
      next if (1..3) === n.abs && o[:dir] == n > 0
      return { ok: false, i: }
    }
end

puts "#{lines.count { check(_1)[:ok] }} reports are safe"

def check_with_one_removed(l) 
  o, i = check(l).values
  return o if o
  ((i - 1 < 0 ? 0 : i - 1)..(i + 1)).each do |j|
    return true if check(j == 0 ? l[1..] : l[0..j - 1] + l[j + 1..])[:ok]
  end
  false
end

safe_v2 = 
  
puts "#{lines.count { check_with_one_removed(_1) }} reports are safe"
