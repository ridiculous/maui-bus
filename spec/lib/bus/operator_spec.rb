require 'spec_helper'

describe Bus::Operator do
  let(:islander) { Kihei.new.islander }
  let(:villager) { Kihei.new.villager }
  let(:kaanapali) { Kaanapali.new.islander }
  let(:start_time) { Time.zone.parse('14:30') }
  let(:end_time) { Time.zone.parse('17:31') }

  context 'Kaanapali' do
    context 'Islander' do
      let(:options) {
        {
          bus: 1,
          start_time: start_time,
          end_time: end_time
        }
      }
      subject { Bus::Operator.new(kaanapali, 2, options) }

      it 'should #bus_active?' do
        subject.bus_active?(start_time).should be_truthy
        subject.bus_active?(start_time - 10.minutes, 40.minutes).should be_truthy
        subject.bus_active?(end_time - 1.minute).should be_truthy
      end

      it 'should not be #bus_active?' do
        subject.bus_active?(start_time - 31.minutes).should be_falsey
        subject.bus_active?(end_time).should be_falsey
      end

      it 'should #bus_about_active?' do
        subject.bus_about_active?(start_time).should be_truthy
        subject.bus_about_active?(start_time - Bus::Operator::TIME_ADVANCED).should be_truthy
      end

      it 'should not be #bus_about_active?' do
        subject.bus_about_active?(start_time - 31.minutes).should be_falsey
        subject.bus_about_active?(end_time + 1.minute).should be_falsey
        subject.bus_about_active?(end_time).should be_falsey
      end

      it 'should #no_delay?' do
        subject.should_not be_no_delay
      end

      it 'should be #delayed_bus?' do
         subject.delayed_bus?(1).should be_truthy
         subject.delayed_bus?(2).should be_falsey
      end
    end
  end

  context 'Kihei' do
    context 'Islander' do
      subject { Bus::Operator.new(islander, 2, {}) }

      its(:total_buses) { should == 2 }
      its(:route) { should be islander }

      it 'should be #no_delay?' do
        subject.should be_no_delay
      end

      it 'should get #upcoming_stops for a single bus' do
        bus2_stops = subject.upcoming_stops(1, start_time)
        bus2_stops.length.should == 35
        bus2_stops.first.time.should == start_time

        bus1_stops = subject.upcoming_stops(0, end_time)
        bus1_stops.length.should == 35
        bus1_stops.first.time.should == Time.zone.parse('19:30')
      end

      it 'should #find_between point_a and point_b at current_time' do
        next_stops = subject.find_between('queen_kaahumanu', 'piilani_shopping_center', Time.zone.parse('6:00 PM'))
        next_stops.length.should == 2
        nxt = next_stops[0]
        nxt.should be_a(Bus::DirectRoute)
        nxt.start_at.should be_a(Bus::NextStop)
        nxt.start_at.time.should == Time.zone.parse('7:30 PM')
        nxt.start_at.bus_stop.location.should == :queen_kaahumanu
        nxt.stop_at.time.should == Time.zone.parse('8:03 PM')
        nxt.stop_at.bus_stop.location.should == :piilani_shopping_center

        nxt2 = next_stops[1]
        nxt2.start_at.time.should == Time.zone.parse('6:30 PM')
        nxt2.start_at.bus_stop.location.should == :queen_kaahumanu
        nxt2.stop_at.time.should == Time.zone.parse('7:03 PM')
        nxt2.stop_at.bus_stop.location.should == :piilani_shopping_center
      end
    end

    context 'Villager' do
      subject { Bus::Operator.new(villager, 1, {}) }

      its(:total_buses) { should == 1 }
      its(:route) { should be villager }

      it 'should find upcoming stops for a given time (default now)' do
        buses = subject.next_stops(5, Time.zone.parse('12:00 PM'))
        buses.length.should == 1
        next_stops = buses.first
        next_stops.length.should == 5
        next_stops[0].time.should == Time.zone.parse('12:05 PM')
        next_stops[0].bus_stop.location.should == :maalaea_harbor
        next_stops[1].time.should == Time.zone.parse('12:17 PM')
        next_stops[1].bus_stop.location.should == :uwapo_south_kihei
        next_stops[2].time.should == Time.zone.parse('12:19 PM')
        next_stops[2].bus_stop.location.should == :ohukai_south_kihei
        next_stops[3].time.should == Time.zone.parse('12:21 PM')
        next_stops[3].bus_stop.location.should == :kaonoulu_south_kihei_makai
        next_stops[4].time.should == Time.zone.parse('12:22 PM')
        next_stops[4].bus_stop.location.should == :kulanihakoi_south_kihei
      end
    end
  end
end