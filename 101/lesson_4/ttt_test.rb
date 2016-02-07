require 'minitest/autorun'

require_relative 'ttt.rb'

describe "joinor" do

  describe "for empty arrays" do

    it "returns empty string for empty arrays" do
      assert_equal "", joinor([])
    end
  end

  describe "for single element arrays" do

    it "returns the only element as a string" do
      assert_equal "a" , joinor(["a"])
      assert_equal "1" , joinor([1])
      assert_equal '{"a"=>1}', joinor([ {'a' => 1} ])
      assert_equal "1, 2, 3, a, b, c" , joinor([ [1,2,3], ['a', 'b', 'c'] ])
    end
  end

end

describe "computer_defense" do

  describe "when there is no defensive play" do

    it "returns nil for an empty board" do
      board = { 1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
      assert_equal nil, computer_defense(board)
    end

    it "returns nil for a horizontally blocked board" do
      board = {1=>"X", 2=>"O", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
      assert_equal nil, computer_defense(board)
    end

    it "returns nil for a vertically blocked board" do
      board = {1=>"X", 2=>" ", 3=>" ", 4=>"O", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
      assert_equal nil, computer_defense(board)
    end

    it "returns nil for a diagonally blocked board" do
      board = {1=>"X", 2=>" ", 3=>" ", 4=>"", 5=>"O", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
      assert_equal nil, computer_defense(board)
    end
  end

  describe "when there is a defensive play" do

    it "returns at risk square for a horizontally threatened board" do
      board = {1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
      assert_equal [3], computer_defense(board)
    end

    it "returns at risk square for a vertically threatened board" do
      board = {1=>"X", 2=>" ", 3=>" ", 4=>"X", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
      assert_equal [7], computer_defense(board)
    end

    it "returns at risk square for a diagonally threatened board" do
      board = {1=>"X", 2=>" ", 3=>" ", 4=>"", 5=>"X", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
      assert_equal [9], computer_defense(board)
    end

    it "returns at risk square for a multiply threatened board" do
      board = {1=>"X", 2=>"X", 3=>" ", 4=>"", 5=>"X", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
      assert_equal [3, 8, 9], computer_defense(board)
    end
  end
end