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

  context '#time' do
    let(:haiku_islander) { Haiku.islander }
    let(:loop_five) { Kahului.loop_five }
    let(:airport) { haiku_islander.find(:kahului_airport).last }
    let(:islander_mall) { haiku_islander.find(:queen_kaahumanu).last }
    let(:mall) { loop_five.find(:queen_kaahumanu).last }
    let(:roselani_place) { loop_five.find(:roselani_place).last }
    let(:first_leg_start) { Bus::NextStop.new(airport, Time.zone.parse(airport.find_time('12:43'))) }
    let(:first_leg_stop) { Bus::NextStop.new(mall, Time.zone.parse(islander_mall.find_time('13:00'))) }
    let(:last_leg_start) { Bus::NextStop.new(mall, Time.zone.parse(mall.find_time('13:30'))) }
    let(:last_leg_stop) { Bus::NextStop.new(roselani_place, Time.zone.parse(roselani_place.find_time('13:41'))) }
    let(:first_leg) { Bus::DirectRoute.new(haiku_islander, first_leg_start, first_leg_stop) }
    let(:last_leg) { Bus::DirectRoute.new(loop_five, last_leg_start, last_leg_stop) }
    let(:course) { Course.new(first_leg) }

    context 'when last_leg is nil' do
      it 'should calculate the travel time with first_leg.stop_at' do
        course.time.should == 1020.0
        course.time.to_duration.should == '17 min'
      end

      it 'should calculate the travel time with other_legs if present' do
        course.other_legs = [last_leg]
        course.time.should == 3480.0
        course.time.to_duration.should == '58 min'
      end
    end

    context 'when last_leg present' do
      it 'should calculate the travel time with last_leg.stop_at' do
        course.last_leg = last_leg
        course.time.should == 3480.0
        course.time.to_duration.should == '58 min'
      end
    end
  end
end