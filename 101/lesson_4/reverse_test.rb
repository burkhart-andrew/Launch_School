require 'minitest/autorun'
require 'minitest/pride'

require_relative 'reverse.rb'

describe "reverse" do

  describe "with 10,000 elements" do
    it "returns new array in reverse order" do
      assert_equal (0..10_000).to_a, reverse((0..10_000).to_a.reverse)
    end
  end


  describe "with three elements" do

    it "returns three strings in reverse order" do
      assert_equal ["c", "b", "a"], reverse(["a", "b", "c"])
    end
  end

  describe "for single element arrays" do
    it "returns a new array with the original single element" do
      assert_equal ["a"], reverse(["a"])
    end
  end

  describe "for empty arrays" do
    it "returns a new empty array" do
      assert_equal [], reverse([])
    end
  end

  it "does not modify the original array" do
    input = ['a,', 'b', 'c']
    reverse(input)
    assert_equal ['a,', 'b', 'c'], input
  end


end
