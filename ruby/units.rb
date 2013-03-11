class Numeric
  def thousands
    self * 1000
  end

  def thousand
    self.thousands
  end

  def millions
    self.thousands.thousands
  end

  def million
    self.millions
  end
end
