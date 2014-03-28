require 'spec_helper'

describe Course do
  context 'legs' do
    let(:course) { Course.new }

    it 'should combine last and others into legs' do
      course.legs.should == []
      course.last_leg = nil
      course.other_legs.should == []
      other = Leg.new
      last_leg = Leg.new
      course.other_legs << Leg.new
      course.legs.should == [other]
      course.last_leg = last_leg
      course.legs.should == [other, last_leg]
    end
  end
end