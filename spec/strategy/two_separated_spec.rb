require "spec_helper"

describe TwoInARow do
  describe "#execute" do
    it "places the opposite number in between two of the same" do
      grid = [
        %w(1 . 0 .),
        %w(. . . .),
        %w(1 . . .),
        %w(. . . 1),
      ]

      strategy = TwoSeparated.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(1 . 0 .),
        %w(0 . . .),
        %w(1 . . .),
        %w(. . . 1),
        ])
    end

    it "works multiple times in a line" do
      grid = [
        %w(1 . 0 . . .),
        %w(. . . . . .),
        %w(1 . . . . .),
        %w(0 . . . . .),
        %w(. . . . . .),
        %w(0 . . 1 . .),
      ]

      strategy = TwoSeparated.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(1 . 0 . . .),
        %w(0 . . . . .),
        %w(1 . . . . .),
        %w(0 . . . . .),
        %w(1 . . . . .),
        %w(0 . . 1 . .),
        ])
    end

    it "works across multiple rows and columns" do
      grid = [
        %w(1 . 0 . . .),
        %w(. . . . . .),
        %w(1 . 1 . . .),
        %w(0 . . . . .),
        %w(. . 1 . . .),
        %w(0 . . 1 . .),
      ]

      strategy = TwoSeparated.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(1 . 0 . . .),
        %w(0 . . . . .),
        %w(1 0 1 . . .),
        %w(0 1 0 . . .),
        %w(1 0 1 . . .),
        %w(0 . . 1 . .),
        ])
    end
  end
end
