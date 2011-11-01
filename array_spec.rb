require File.expand_path(File.dirname(__FILE__) + '/../../../lib/ext/array')

describe Array, "#in?" do
  it "returns true when the two arrays share at least one element" do
    [1, 2, 3].in?([3, 4, 5]).should be_true
  end

  it "returns false when the two arrays have no matching elements" do
    [1, 2, 3].in?([4, 5, 6]).should be_false
  end

  it "returns false for an empty array argument" do
    [1, 2, 3].in?([]).should be_false
  end

  it "returns false when the parent array is empty" do
    [].in?([1, 2, 3]).should be_false
  end

  it "returns false when comparing two empty arrays" do
    [].in?([]).should be_false
  end

  describe "block condition" do
    let!(:source) { ['one', 'two', 'three'] }

    it "returns true if the block condition is true" do
      source.in?(['th']) { |a, b| a =~ /#{b}.*/ }.should be_true
    end

    it "returns false if the block condition is false" do
      source.in?(['z']) { |a, b| a =~ /#{b}.*/ }.should be_false
    end
  end
end
