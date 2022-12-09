require 'set'
rows = File.read("input.txt").split("\n")

# part one
visible_trees = Set.new
col_maxes = []
rows[0].split("").each do
  col_maxes.push(-1)
end
rows.each_with_index do | row, i |
  curr_row_max = -1
  row = row.split("")
  row.each_with_index do | item, j |
    if item.to_i > curr_row_max
      visible_trees.add("#{i}-#{j}")
      curr_row_max = item.to_i
    end
    if item.to_i > col_maxes[j]
      visible_trees.add("#{i}-#{j}")
      col_maxes[j] = item.to_i
    end
  end
end

col_maxes = []
rows[0].split("").each do
  col_maxes.push(-1)
end
(0..rows.length - 1).reverse_each do | i |
  curr_row_max = -1
  row = rows[i].split("")
  (0..row.length - 1).reverse_each do | j |
    if row[j].to_i > curr_row_max
      visible_trees.add("#{i}-#{j}")
      curr_row_max = row[j].to_i
    end
    if row[j].to_i > col_maxes[j]
      visible_trees.add("#{i}-#{j}")
      col_maxes[j] = row[j].to_i
    end
  end
end

puts visible_trees.count

# part two
max_scenic_score = 0
trees = rows.map { |row| row.split("").map(&:to_i) }
trees.each_with_index do | row, i |
  row.each_with_index do | tree, j |
    # left
    iter = j - 1
    left_score = 0
    while iter >= 0 do 
      left_score += 1
      if tree <= trees[i][iter]
        break
      end
      iter -= 1
    end

    # right
    iter = j + 1
    right_score = 0
    while iter < row.length do 
      right_score += 1
      if tree <= trees[i][iter]
        break
      end
      iter += 1
    end

    # up
    iter = i - 1
    up_score = 0
    while iter >= 0 do
      up_score += 1
      if tree <= trees[iter][j]
        break
      end
      iter -= 1
    end

    # down
    iter = i + 1
    down_score = 0
    while iter < trees.length do
      down_score += 1
      if tree <= trees[iter][j]
        break
      end
      iter += 1
    end

    max_scenic_score = [max_scenic_score, (left_score * right_score * up_score * down_score)].max
  end
end

puts max_scenic_score

