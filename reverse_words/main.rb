require 'benchmark'

puts(Benchmark.measure do
  lines = []
  File.open('B-large-practice.in').each_line { |line| lines << line }
  n = lines[0].to_i
  (1..n).each do |i|
    line = lines[i]
    words = line.split(' ')

    j = words.count - 1
    new_word = []
    while j >= 0
      new_word << words[j]
      j -= 1
    end
    "Case ##{i}: #{new_word.join(' ')}"
  end
end)

#puts File.foreach('in.txt').to_a[1..-1].map.with_index { |val, i| "Case ##{i + 1}: #{val.split(' ').reverse.join(' ')}" }
puts(Benchmark.measure do
  File.foreach('B-large-practice.in').to_a[1..-1].map.with_index { |val, i| "Case ##{i + 1}: #{val.split(' ').reverse.join(' ')}" }
end)
