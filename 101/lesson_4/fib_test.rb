require 'minitest/autorun'
require 'minitest/pride'

require_relative 'fib.rb'

describe "fib" do

  it "generates the first fib number" do
    assert_equal 0, fib(0)
  end

  it "generates the second fib number" do
    assert_equal 1, fib(1)
  end

  it "generates the third fib number" do
    assert_equal 1, fib(2)
  end

  it "generates the fourth fib number" do
    assert_equal 2, fib(3)
  end

  it "generates the fifth fib number" do
    assert_equal 3, fib(4)
  end

  it "generates the sixth fib number" do
    assert_equal 5, fib(5)
  end
end

describe "fib?" do

  it "identifies 1 as a fib number" do
    assert_equal true, fib?(1)
  end

  it "rejects 4 as a fib number" do
    assert_equal false, fib?(4)
  end

  it "identifies 21 as a fib number" do
    assert_equal true, fib?(21)
  end

  it "rejects 24 as a fib number" do
    assert_equal false, fib?(24)
  end
end

describe "select_if_fib" do
  let(:array) { ('a'..'z').to_a }
  # def array
  #   return @array if @array
  #   @array = ('a'..'z').to_a
  # end

  it "returns the first element" do
    assert_equal 'a', select_if_fib(array, 0)
  end

  it "returns the second element" do
    assert_equal 'b', select_if_fib(array, 1)
  end

  it "does not return the fifth element" do
    assert_equal nil, select_if_fib(array, 4)
  end

  it "returns the 22st element" do
    assert_equal 'v', select_if_fib(array, 21)
  end

  it "does not return the 23nd element" do
    assert_equal nil, select_if_fib(array, 22)
  end

  it "does not return the 35th element" do
    assert_equal nil, select_if_fib(array, 34)
  end
end