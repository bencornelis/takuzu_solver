require "spec_helper"

describe ThreeInARow do
  describe "#execute" do
    it "places the opposite number next to a double" do
      grid = [
        %w(. . . .),
        %w(. . . .),
        %w(1 1 . .),
        %w(. . . .),
      ]

      strategy = ThreeInARow.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(. . . .),
        %w(. . . .),
        %w(1 1 0 .),
        %w(. . . .),
        ])
    end

    it "places the opposite number in between two of the same" do
      grid = [
        %w(0 . . .),
        %w(. . . .),
        %w(0 . . .),
        %w(. . . .),
      ]

      strategy = ThreeInARow.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(0 . . .),
        %w(1 . . .),
        %w(0 . . .),
        %w(. . . .),
        ])
    end

    it "works multiple times in a line" do
      grid = [
        %w(. . . . . .),
        %w(. . . . . .),
        %w(1 . 1 . 0 0),
        %w(. . . . . .),
        %w(. . . . . .),
        %w(. . . . . .),
      ]

      strategy = ThreeInARow.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(. . . . . .),
        %w(. . . . . .),
        %w(1 0 1 1 0 0),
        %w(. . . . . .),
        %w(. . . . . .),
        %w(. . . . . .),
        ])
    end

    it "works across multiple rows and columns" do
      grid = [
        %w(0 0 . .),
        %w(. . . .),
        %w(. . 0 .),
        %w(. . 0 0),
      ]

      strategy = ThreeInARow.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(0 0 1 .),
        %w(. . 1 .),
        %w(. . 0 .),
        %w(. 1 0 0),
        ])
    end
  end
end
