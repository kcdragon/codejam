lines = []
ARGF.each_with_index do |line, index|
  lines << line.strip if index != 0
end

lines.map(&:to_i).each_with_index do |n, index|
  if n == 0
    puts "Case ##{index + 1}: INSOMNIA"
    next
  end

  seen = []
  i = 1
  while seen.count != 10
    new_number = n * i
    seen = seen.concat(new_number.to_s.chars).uniq
    i += 1
  end

  puts "Case ##{index + 1}: #{new_number}"
end
