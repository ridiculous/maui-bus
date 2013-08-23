class Voyage

  attr_accessor :leg_1, :leg_2, :leg_3

  def initialize(pointa, pointb=nil, pointc=nil)
    @leg_1 = pointa
    @leg_2 = pointb
    @leg_3 = pointc
  end

  def complete?
    leg_1 && leg_2 && leg_3
  end
end