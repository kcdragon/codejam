lines = []
ARGF.each_with_index do |line, index|
  lines << line.strip if index != 0
end

lines.each_with_index do |letters, index|
  solution = ''
  letters.split('').each do |letter|
    if solution == ''
      solution = letter
    else
      if solution[0] > letter
        solution += letter
      else
        solution = letter + solution
      end
    end
  end
  puts "Case ##{index + 1}: #{solution}"
end
