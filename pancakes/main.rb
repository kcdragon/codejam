require 'byebug'

stacks = []
ARGF.each_with_index do |line, index|
  stacks << line.strip if index != 0
end

#stacks = ['++-++++---']

stacks.each_with_index do |stack, _case|
  #next unless _case == 5

  #puts stack
  stack = stack.chars.map do |pancake|
    pancake == '+'
  end

  previous_stack = nil

  i = 0
  #puts stack.join(',')

  _last_index = ->(stack) {
    #debugger if stack == [true,true,true,true,true,false,true,true,true,true]
    if stack[0]
      #stack.rindex(true)
      index = stack.rindex(false)
      if index.nil?
        return index
      end
      stack[0...index].rindex(true)
    else
      stack.rindex(false)
    end
  }

  while last_index = _last_index.(stack)
    # if stack && previous_stack
    #   if stack == previous_stack
    #     last_index -= 1
    #   end
    # end

    previous_stack = stack.dup

    #puts stack.join(',')

    copy_of_stack = stack.dup
    (0..last_index).each do |index|
      stack[index] = !copy_of_stack[last_index - index]
    end

    while stack == copy_of_stack
      #puts stack
      last_index -= 1

      copy_of_stack = stack.dup
      (0..last_index).each do |index|
        stack[index] = !copy_of_stack[last_index - index]
      end
    end

    # if stack == copy_of_stack
    #   last_index -= 1

    #   copy_of_stack = stack.dup
    #   (0..last_index).each do |index|
    #     stack[index] = !copy_of_stack[last_index - index]
    #   end
    # end

    #puts stack.join(',')

    i += 1

    previous_stack = stack.dup
  end

  puts "Case ##{_case + 1}: #{i}"
end
