# setup
require 'set'
instructions = File.read("input.txt").split("\n")

h_x = 0
h_y = 0
t_x = 0
t_y = 0
visited = Set.new
visited.add("#{t_x},#{t_y}")
instructions.each do | instruction |
  dir, dist = instruction.split
  dist.to_i.times do
    case dir
    when 'U'
      h_y += 1
    when 'D'
      h_y -= 1
    when 'R'
      h_x += 1
    when 'L'
      h_x -= 1
    end
    x_dist = h_x - t_x
    y_dist = h_y - t_y
    total_distance = x_dist.abs + y_dist.abs
    if (total_distance == 2 && (x_dist == 0 || y_dist == 0)) || total_distance > 2
      if x_dist > 0
        t_x += 1
      elsif x_dist < 0
        t_x -= 1
      end

      if y_dist > 0
        t_y += 1
      elsif y_dist < 0
        t_y -= 1
      end
      visited.add("#{t_x},#{t_y}")
    end
  end
end

puts visited.size
