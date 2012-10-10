require_relative "./spec_helper"
require_relative "../025"

describe "problem25" do

  it "should fail when looking for less than 1 digit" do
    expect { problem25(0) }.to raise_error(ArgumentError)
  end

  it "should find first with 1 digit" do
    expect(problem25(1)).to eq(1)
  end

  it "should find first with 2 digits" do
    expect(problem25(2)).to eq(7)
  end

  it "should find first with 3 digits" do
    expect(problem25(3)).to eq(12)
  end

end