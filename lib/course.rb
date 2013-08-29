class Course
  attr_accessor :first_leg, :last_leg, :other_legs

  def initialize(first_leg=nil, last_leg=nil, others=[])
    @first_leg = first_leg
    @last_leg = last_leg
    @other_legs = others
  end

  def latest_leg
    other_legs[-1] || first_leg
  end

  def rank
    (first_leg.try(:rank) || 0) + other_legs.length + (last_leg ? 1 : 0)
  end

end