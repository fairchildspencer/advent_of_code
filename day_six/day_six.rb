require 'set'
# setup
file_data = File.read('input.txt').split('')

def get_marker_start(file_data, size)
  answer = 0
  for i in 0..file_data.length - 1
    chars = file_data.slice(i, size).to_set
    if chars.size() === size
      answer = i + size
      break
    end
  end
  answer
end

# part one
puts get_marker_start(file_data, 4)

# part two
puts get_marker_start(file_data, 14)