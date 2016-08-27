require 'spec_helper'

RSpec.describe 'integration test' do

  it 'solves for horizontal grid with X as winner' do
    grid = [
      %w(X X X T),
      %w(. . . .),
      %w(O O . .),
      %w(. . . .)
    ]

    expect(Solver.new(grid).winner).to eq('X')
  end

  it 'solves for horizontal grid with O as winner' do
    grid = [
      %w(O O O T),
      %w(. . . .),
      %w(X X . .),
      %w(. . . .)
    ]

    expect(Solver.new(grid).winner).to eq('O')
  end

  it 'solves for vertical grid with O as winner' do
    grid = [
      %w(O O X X),
      %w(O X X X),
      %w(O X . T),
      %w(O . . O)
    ]

    expect(Solver.new(grid).winner).to eq('O')
  end
end
