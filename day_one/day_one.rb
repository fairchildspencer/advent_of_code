# setup
file_data = File.read('input_one.txt')
elves = file_data.split("\n\n")

# part one
calorie_count = elves.map do | elf | 
	items = elf.split.map(&:to_i)
	elf = items.sum
end

puts (calorie_count.max)

# part two
top_elves = []
for i in 0..2
	top_elves.push(calorie_count.max)
	calorie_count.delete(calorie_count.max)
end

puts(top_elves.sum)