require "spec_helper"

describe IdenticalLines do
  describe "#execute" do
    it "prevents two rows from being identical" do
      grid = [
        %w(1 0 0 1),
        %w(1 . 0 .),
        %w(. . . .),
        %w(. . . .),
      ]

      strategy = IdenticalLines.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(1 0 0 1),
        %w(1 1 0 0),
        %w(. . . .),
        %w(. . . .),
        ])
    end

    it "prevents two columns from being identical" do
      grid = [
        %w(1 1 . .),
        %w(. 0 . .),
        %w(. 1 . .),
        %w(0 0 . .),
      ]

      strategy = IdenticalLines.new(grid)
      strategy.execute

      expect(grid).to eq([
        %w(1 1 . .),
        %w(1 0 . .),
        %w(0 1 . .),
        %w(0 0 . .),
        ])
    end
  end
end
