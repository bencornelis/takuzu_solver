require "spec_helper"

describe TwoInARow do
  describe "#execute" do
    it "places the opposite number next to a double" do
      grid = [
        %w(1 . 0 .),
        %w(. . . 1),
        %w(1 1 . .),
        %w(. 0 . 1),
      ]

      strategy = TwoInARow.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(1 . 0 .),
        %w(. . . 1),
        %w(1 1 0 .),
        %w(. 0 . 1),
        ])
    end

    it "works multiple times in a line" do
      grid = [
        %w(1 . . . . .),
        %w(. . . . . .),
        %w(1 1 . . 0 0),
        %w(. 0 . . . .),
        %w(. . . . . .),
        %w(. . . . . .),
      ]

      strategy = TwoInARow.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(1 . . . . .),
        %w(. . . . . .),
        %w(1 1 0 1 0 0),
        %w(. 0 . . . .),
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

      strategy = TwoInARow.new(grid)
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
