def print(matrix)
  matrix.each do |line|
    puts line.join(' ')
  end
  puts
end

def not_complete?(matrix)
  matrix.any? do |line|
    line.any? { |height| height == 'E' }
  end
end

lines = []
ARGF.each_with_index do |line, index|
  lines << line.strip if index != 0
end

n = lines[0].to_i
lines = lines[1..(2 * n - 1)]

solution = Array.new(n) { Array.new(n) { 'E' } }

lines = lines.map do |line|
  line.split(' ')
end

# first row and column
sorted_lines = lines.sort_by do |line|
  line[0]
end

# smallest height
smallest_height = sorted_lines[0][0]

lines_with_smallest_height = sorted_lines.select do |line|
  line[0] == smallest_height
end

first_row = lines_with_smallest_height[0]
first_column = lines_with_smallest_height[1]

first_row.each_with_index do |height, index|
  solution[0][index] = height
end

first_column.each_with_index do |height, index|
  solution[index][0] = height
end

sorted_lines = (sorted_lines - [first_row, first_column])

puts 'New Lines'
print(sorted_lines)

puts 'Solution'
print(solution)

while not_complete?(solution)
  new_solution = nil
  solution.each_with_index do |solution_line, row|
    if solution_line.any? { |height| height == 'E' }
      matching_sorted_lines = sorted_lines.select do |line|
        index = 0
        solution_line.select do |height|
          height != 'E'
        end.all? do |height|
          result = height == line[index]
          index += 1
          result
        end
      end

      print(matching_sorted_lines)

      new_solution = solution.dup
      new_solution[row] = matching_sorted_lines[0]
      matching_sorted_lines = matching_sorted_lines - [matching_sorted_lines[0]]

      puts 'Solution'
      print(new_solution)

      break
    end
  end

  solution = new_solution
end

puts 'Final Solution'
print(solution)

rows = solution
columns = Array.new(n) { Array.new(n) }

solution.each_with_index do |row, x|
  row.each_with_index do |height, y|
    columns[x][y] = height
  end
end

puts 'Rows'
print(rows)

puts 'Columns'
print(columns)
