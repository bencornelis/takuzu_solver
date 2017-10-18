require "spec_helper"

describe MatchingCounts do
  describe "#execute" do
    it "makes sure every row has the same number of 1's and 0's" do
      grid = [
        %w(1 . 1 .),
        %w(. . . .),
        %w(. . . .),
        %w(. . . 1),
      ]

      strategy = MatchingCounts.new
      new_grid = strategy.execute(grid)

      expect(new_grid).to eq([
        %w(1 0 1 0),
        %w(. . . .),
        %w(. . . .),
        %w(. . . 1),
        ])
    end

    it "works across rows and columns" do
      grid = [
        %w(1 . 1 .),
        %w(. . . .),
        %w(. . . .),
        %w(. 0 . .),
      ]

      strategy = MatchingCounts.new
      new_grid = strategy.execute(grid)

      expect(new_grid).to eq([
        %w(1 0 1 0),
        %w(. 1 . .),
        %w(. 1 . .),
        %w(. 0 . .),
        ])
    end
  end
end
