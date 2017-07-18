require "spec_helper"
require "pry"
describe Takuzu do
  describe ".build" do
    it "builds the grid from a string" do
      str = %(
        1 0 . 0
        . . . 0
        1 . . .
        . . . 1
      )

      grid = Takuzu.build(str).grid
      expect(grid).to eq ([
        %w(1 0 . 0),
        %w(. . . 0),
        %w(1 . . .),
        %w(. . . 1),
      ])
    end
  end

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
