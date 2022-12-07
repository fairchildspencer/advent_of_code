# setup
commands = File.read("input.txt").split("\n")

tree = { "/" => Hash.new }
curr_dir = tree["/"]
prev_dirs = [curr_dir]
for i in 1..commands.length - 1
  line = commands[i].split(" ")
  if (line[0] === "$")
    next unless line[1] === "cd"
    if (line[2] === "..")
      curr_dir = prev_dirs.pop
    else
      prev_dirs.push(curr_dir)
      curr_dir = curr_dir[line[2]]
    end
  else
    if (line[0] === "dir")
      curr_dir[line[1]] = Hash.new
    else
      curr_dir[line[1]] = line[0].to_i
    end
  end
end

TARGET_DIRS = []
def part_one_action (sum)
  if (sum < 100000)
    TARGET_DIRS.push(sum)
  end
end

SUFFICIENT_DIRS = []
TARGET = 0
def part_two_action (sum)
  if (sum >= TARGET)
    SUFFICIENT_DIRS.push(sum)
  end
end

def traverse (tree, part_one)
  sum = 0
  tree.each do |key, value|
    if (value.is_a?(Hash))
      sum += traverse(value, part_one)
    else
      sum += value
    end
  end
  if (part_one)
    part_one_action(sum)
  else
    part_two_action(sum)
  end
  return sum
end

# part one
total = traverse(tree, true)
puts TARGET_DIRS.sum

# part two
TARGET = 30000000 - (70000000 - total)
traverse(tree, false)
puts SUFFICIENT_DIRS.min

