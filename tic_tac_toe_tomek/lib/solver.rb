class Solver

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def winner
    x_wins_any_row = grid.any? do |row|
      row.all? do |character|
        character == 'X' || character == 'T'
      end
    end

    o_wins_any_row = grid.any? do |row|
      row.all? do |character|
        character == 'O' || character == 'T'
      end
    end

    o_wins_any_columns = (0..3).all? do |x|
      grid[x][0] == 'O' || grid[x][0] == 'T'
    end

    if x_wins_any_row
      'X'
    elsif o_wins_any_row
      'O'
    elsif o_wins_any_columns
      'O'
    end
  end
end
