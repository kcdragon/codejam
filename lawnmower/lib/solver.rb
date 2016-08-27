class Solver

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def doable?
    n = grid.count
    m = grid[0].count

    all_1s_are_valid = true

    (0...n).each do |x|
      (0...m).each do |y|
        if grid[x][y] == '1'
          result = (grid[x].all? { |value| value == '1' } || grid.all? { |row| row[y] == '1' })
          all_1s_are_valid &&= result
        end
      end
    end

    all_1s_are_valid
  end
end
