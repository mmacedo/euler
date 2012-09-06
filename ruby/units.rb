class Numeric
  def thousands
    self * 1000
  end

  def millions
    self.thousands.thousands
  end
end
