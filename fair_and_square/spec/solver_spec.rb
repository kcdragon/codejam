require 'spec_helper'

RSpec.describe 'integration test' do

  describe '#palindrome?' do
    it 'true for odd palindromes' do
      expect(Solver.new(nil, nil).palindrome?(12321)).to eq(true)
    end

    it 'true for even palindromes' do
      expect(Solver.new(nil, nil).palindrome?(123321)).to eq(true)
    end

    it 'false for odd non-palindromes' do
      expect(Solver.new(nil, nil).palindrome?(21321)).to eq(false)
    end

    it 'false for even non-palindromes' do
      expect(Solver.new(nil, nil).palindrome?(213321)).to eq(false)
    end

    it 'true for single digit numbers' do
      expect(Solver.new(nil, nil).palindrome?(1)).to eq(true)
    end
  end

  describe '#fair_and_square_count' do

    it 'solves for small case' do
      expect(Solver.new(1, 4).fair_and_square_count).to eq(2)
    end

    it 'solves for medium case' do
      expect(Solver.new(10, 120).fair_and_square_count).to eq(0)
    end

    it 'solves for large case' do
      expect(Solver.new(10, 1000).fair_and_square_count).to eq(2)
    end

    it 'solves for extemely large case' do
      puts Solver.new(10, (10 ** 100)).fair_and_square_count
    end
  end

end
