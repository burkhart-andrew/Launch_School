require 'minitest/autorun'
require 'minitest/pride'

require_relative 'pal.rb'

describe "pal?" do
  it "empty input" do
    assert_equal true, pal?("")
  end
  it "single letter word" do
    assert_equal true, pal?("a")
  end
  it "double letter word " do
    assert_equal false, pal?("ab")
  end
  it "four letter word" do
    assert_equal false, pal?("abca")
  end

  it "alex input" do
    assert_equal false, pal?('baac')
  end

  it "long phrase" do
    assert_equal true, pal?('race car')
  end

  it "longer phrase" do
    assert_equal false, pal?('step no an pets')
  end

end


