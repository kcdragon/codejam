lines = DATA.read.split("\n")
n = lines[0].to_i
matrix = []
n.times do
  x = []
  n.times do
    x << false
  end
  matrix << x
end
puts "lines = #{lines}"
lines.to_a[1..-1].each do |line|
  puts line
  line = line.split(' ').map(&:to_i)
  x = line[0].to_i - 1
  y = line[1].to_i - 1
  puts "x: #{x}"
  puts "y: #{y}"
  matrix[x][y] = true
  matrix[y][x] = true
end

p matrix

matrix.each do |node|
  if node.select { |x| x }.count == 2
    node.each_with_index do |y, i|
      if y
        if matrix[i].select { |x| x }.count == 2

        end
      end
    end
  else
  end
end

__END__
4
1 2
2 3
3 4
