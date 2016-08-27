require 'spec_helper'

RSpec.describe 'integration test' do

  it 'solves for Yes grid' do
    grid = [
      %w(2 1 2),
      %w(1 1 1),
      %w(2 1 2)
    ]

    expect(Solver.new(grid).doable?).to eq(true)
  end

  it 'solves for No grid' do
    grid = [
      %w(2 2 2 2 2),
      %w(2 1 1 1 2),
      %w(2 1 2 1 2),
      %w(2 1 1 1 2),
      %w(2 2 2 2 2)
    ]

    expect(Solver.new(grid).doable?).to eq(false)
  end

  it 'solves for Yes grid' do
    grid = [
      %w(1 2 1)
    ]

    expect(Solver.new(grid).doable?).to eq(true)
  end

  it 'solves for Yes grid' do
    grid = [
      %w(1 1 1 1 1 1 1 1 1),
      %w(2 1 2 1 1 2 1 1 2),
      %w(1 1 1 1 1 1 1 1 1),
      %w(1 1 1 1 1 1 1 1 1),
      %w(2 1 2 1 1 2 1 1 2),
      %w(2 1 2 1 1 2 1 1 2),
      %w(2 1 2 1 1 2 1 1 2)
    ]

    puts Solver.new(grid).doable?
  end
end
