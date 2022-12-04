# setup
file_data = File.read('input.txt')
pairs = file_data.split("\n")

elf_pairs = []
pairs.each do | pair |
  elves = pair.split(",")
  elf_one = elves[0].split("-").map(&:to_i)
  elf_two = elves[1].split("-").map(&:to_i)
  elf_pairs.push([elf_one, elf_two])
end

# part one
sum = 0
elf_pairs.each do | pair |
  high_range = [pair[0][1], pair[1][1]]
  low_range = [pair[0][0], pair[1][0]]

  if low_range.index(low_range.min) === high_range.index(high_range.max) || low_range.rindex(low_range.min) === high_range.rindex(high_range.max)
    sum += 1
  end
end

puts sum

sum = 0
elf_pairs.each do | pair |
  high_range = [pair[0][1], pair[1][1]]
  low_range = [pair[0][0], pair[1][0]]
  if low_range.max <= high_range.min
    sum += 1
  end
end

puts sum

