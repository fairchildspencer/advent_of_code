# setup
file_data = File.read('input.txt').split("\n")
crates = file_data.slice(0, 8)
instructions_raw = file_data.slice(10..)

stacks = []
1.step(crates[0].length - 1, 4).each do |i|
  stack = []
  for j in 0..7
    if crates[j][i] != " "
      stack.push(crates[j][i])
    end
  end
  stacks.push(stack.reverse)
end

# num crates, from, to
instructions = []
instructions_raw.each do | instruction |
  words = instruction.split(" ")
  instructions.push([words[1].to_i, words[3].to_i, words[5].to_i])
end

def get_top(stacks)
  top = ""
  stacks.each do | stack |
    top += stack[-1]
  end
  return top
end

# part one
instructions.each do | instruction |
  for i in 0..instruction[0] - 1
    stacks[instruction[2] - 1].push(stacks[instruction[1] - 1].pop)
  end
end

puts puts get_top(stacks)

# part two
instructions.each do | instruction | 
  ordered_crates = []
  for i in 0..instruction[0] - 1
    ordered_crates.push(stacks[instruction[1] - 1].pop)
  end

  ordered_crates.reverse.each do | c |
    stacks[instruction[2] - 1].push(c)
  end
end

puts get_top(stacks)



