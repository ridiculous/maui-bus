require 'spec_helper'

describe BusRoute do

  context 'Finders' do

    it 'should find_between' do
      next_stops = Kihei.new.islander.find_between('queen_kaahumanu', 'piilani_shopping_center', Time.zone.parse('6:00 PM'))
      next_stops.length.should == 2
      nxt = next_stops[0]
      nxt.should be_a(DirectRoute)
      nxt.start_at.should be_a(NextStop)
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

    it 'should find the last time for a route' do
      Kihei.islander.last_stop_time.should == Time.zone.parse('9:30 PM')
    end

    it 'should find next stops for a given time (default now)' do
      buses = Kihei.villager.next_stops(5, Time.zone.parse('12:00 PM'))
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
      next_stops[5].time.should == Time.zone.parse('12:22 PM')
      next_stops[5].bus_stop.location.should == :kulanihakoi_south_kihei
    end

    it 'should find next stops for each bus on the route' do
      Kihei.islander.should have(2).buses
      Kihei.villager.should have(1).buses
      Kihei.islander.buses.each { |b| b.should be_a(Bus) }
    end

  end

  context 'Helpers' do
    it 'should return class name' do
      Kihei.islander.class_name.should == 'islander'
    end
    it 'should return full class name' do
      Kihei.islander.full_class_name.should == 'kihei_islander'
    end
    it 'should return unique transfer locations' do
      Kihei.islander.transfer_locations.should == %w[queen_kaahumanu piilani_shopping_center]
    end
  end
end