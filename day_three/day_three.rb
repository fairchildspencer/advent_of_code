require 'set'
# setup
file_data = File.read('input.txt')
ruck_sacks = file_data.split("\n")

def is_upper (c)
  return /[[:upper:]]/.match(c)
end

def char_to_code (char)
  code = char.ord
  if is_upper(char)
    return code - 38
  else
    return code - 96
  end
end

# part one
sum = 0
ruck_sacks.each do | ruck_sack |
  ruck_sack = ruck_sack.split("")
  left, right = ruck_sack.each_slice( (ruck_sack.size/2.0).round ).to_a
  left = left.to_set
  right = right.to_set

  intersection = left.intersection(right).to_a
  sum += char_to_code(intersection[0]) unless !intersection.length
end

puts sum

# part two
sum = 0
(0..ruck_sacks.length - 1).step(3) do |i|
  set_1 = ruck_sacks[i].split("").to_set
  set_2 = ruck_sacks[i + 1].split("").to_set
  set_3 = ruck_sacks[i + 2].split("").to_set

  intersection = set_1.intersection(set_2).intersection(set_3).to_a
  sum += char_to_code(intersection[0]) unless !intersection.length
end

puts sum