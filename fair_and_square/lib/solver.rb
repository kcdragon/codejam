class Solver

  attr_reader :start,:stop

  def initialize(start, stop)
    @start = start
    @stop = stop
  end

  # def fair_and_square_count
  #   count = 0
  #   start.upto(stop) do |n|
  #     sqrt = Math.sqrt(n)
  #     if palindrome?(n) && (sqrt.floor ** 2) == n && palindrome?(sqrt.floor)
  #       count += 1
  #     end
  #   end
  #   count
  # end

  def fair_and_square_count
    count = 0
    Math.sqrt(start).floor.upto(Math.sqrt(stop).floor) do |n|
      if palindrome?(n ** 2) && palindrome?(n) && (n ** 2) <= stop && (n ** 2) >= start
        puts n ** 2
        count += 1
      end
    end
    count
  end

  def palindrome?(number)
    s = number.to_s
    if s.length % 2 == 1
      beginning = s[0...(s.length / 2)]
      ending = s[((s.length / 2) + 1)...s.length]
      beginning == ending.reverse
    else
      beginning = s[0...(s.length / 2)]
      ending = s[(s.length / 2)...s.length]
      beginning == ending.reverse
    end
  end
end
