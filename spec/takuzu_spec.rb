require "spec_helper"

describe Takuzu do
  describe "#solve" do
    it "displays the solved takuzu grid" do
      grid = [
        %w(1 0 . 0),
        %w(. . . 0),
        %w(1 . . .),
        %w(. . . 1),
      ]

      takuzu = Takuzu.new(grid)

      expect {
        takuzu.solve
      }.to output(
        "1 0 1 0\n" +
        "0 1 1 0\n" +
        "1 0 0 1\n" +
        "0 1 0 1\n"
      ).to_stdout
    end
  end
end
