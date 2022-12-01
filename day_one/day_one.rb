# setup
file_data = File.read('input_one.txt')
elves = file_data.split("\n\n")

# part one
calorie_count = elves.map { | elf | elf = elf.split.map(&:to_i).sum }

puts (calorie_count.max)

# part two
puts calorie_count.sort_by {|count| -count}.take(3).sum