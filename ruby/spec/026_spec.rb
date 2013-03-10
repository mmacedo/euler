require_relative "./spec_helper"
require_relative "../026"

describe "problem 26" do

  describe "recurring_cycle" do

    it "should fail if denominator is zero" do
      expect { recurring_cycle(1, 0) }.to raise_error ArgumentError
    end

    it "should return zero without decimals" do
      expect(recurring_cycle(4, 2)).to eq 0
      expect(recurring_cycle(4, 4)).to eq 0
    end

    it "should return zero without a recurring cycle" do
      expect(recurring_cycle(1, 2)).to eq 0
      expect(recurring_cycle(1, 4)).to eq 0
    end

    it "should return a digit with 1-digit recurring cycle" do
      expect(recurring_cycle(1, 3)).to eq 3
    end

    it "should return a digit with 1-digit recurring cycle after fixed decimals" do
      expect(recurring_cycle(1, 6)).to eq 6
      expect(recurring_cycle(7, 12)).to eq 3
    end

    it "should return a digit with 2-digit recurring cycle" do
      expect(recurring_cycle(9, 11)).to eq 81
    end

    it "should return a digit with recurring cycle larger than 2 digits" do
      expect(recurring_cycle(1, 7)).to eq 142857
    end

    it "should return the same value notwithstanding the numerator sign" do
      positive = recurring_cycle(+1, 7)
      negative = recurring_cycle(-1, 7)
      expect(positive).to eq negative
    end

    it "should return the same value notwithstanding the denominator sign" do
      positive = recurring_cycle(1, +7)
      negative = recurring_cycle(1, -7)
      expect(positive).to eq negative
    end

  end

  describe "largest_unit_recurring_cycle" do

    it "should return the first in a range without recurring cycles" do
      expect(largest_unit_recurring_cycle 4..5).to eq 4
    end

    it "should return the last denominator if the it has the largest recurring cycle" do
      expect(largest_unit_recurring_cycle 2..7).to eq 7
    end

    it "should return the denominator with the largest recurring cycle" do
      expect(largest_unit_recurring_cycle 2..10).to eq 7
    end

  end

end
