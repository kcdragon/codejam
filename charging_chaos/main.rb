init = [
  %w(0 1 1),
  %w(1 1 0)
]

solution = %w(11 00 10)

def print_state(state)
  puts "State"
  (0...state[0].count).each do |i|
    puts "Outlet #{i}: #{state[0][i]}#{state[1][i]}"
  end
end

def flip(flow)
  flow.map { |x| x == '0' ? '1' : '0' }
end

def next_states(state)
  new = []
  (0...state.count).each do |i|
    new_state = state.dup
    new_state[i] = flip(new_state[i])
    new << new_state
  end
  new
end

def matches?(state, solution)
  a = []
  (0...state[0].count).each do |i|
    a << "#{state[0][i]}#{state[1][i]}"
  end
  solution.all? do |y|
    a.include?(y)
  end
end

def depth(state, solution, depth)
  if matches?(state, solution)
    return depth
  end

  sol = nil
  next_states(state).each do |state|
    if matches?(state, solution)
      sol = depth + 1
      break
    end
  end
  return sol if sol

  next_states(state).map do |state|
    depth(state, solution, depth + 1)
  end.min
end

def solve(state, solution)
  depth(state, solution, 0)
rescue SystemStackError
  'NOT POSSIBLE'
end

puts "Init"
print_state(init)
puts

#puts flip(%w(0 1 1))
next_states(init).each do |state|
  print_state(state)
  puts matches?(state, solution)
  puts
end

puts "Case #1: #{solve(init, solution)}"

init = [
  %w(1 0 1),
  %w(1 1 1)
]
solution = %w(010 001)
puts "Case #2: #{solve(init, solution)}"

init = [
  %w(0 1),
  %w(1 0)
]
solution = %w(10 01)
puts "Case #3: #{solve(init, solution)}"

puts DATA

__END__

3
3 2
01 11 10
11 00 10
2 3
101 111
010 001
2 2
01 10
10 01
