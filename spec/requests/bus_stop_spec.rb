require 'spec_helper'

describe BusStop do

  context 'Helpers' do

    it "true_location should remove the terms 'across', 'makai', 'parkside'" do
      route = Wailuku.loop_two
      route.stops[4].location.should == :liholiho_kanaloa_ave_parkside
      route.stops[4].true_location.should == 'liholiho_kanaloa_ave'
      route.stops[5].location.should == :wailuku_community_center_across
      route.stops[5].true_location.should == 'wailuku_community_center'
      route.stops[7].location.should == :hawaiian_homes_makai
      route.stops[7].true_location.should == 'hawaiian_homes'
    end

    it 'should find upcoming times without params (default now)' do
      current_time = Time.zone.now

      bus_stop = Kihei.villager.stops[0]
      future_times = bus_stop.future_times
      future_times.each { |a| a.should be_a(ActiveSupport::TimeWithZone) }
      if Kihei.villager.last_stop_time <= current_time
        future_times.first.should > (Time.zone.now - 1.day)
      else
        future_times.first.should > Time.zone.now
      end

    end


    it 'should find upcoming times with valid params' do
      bus_stop = Kihei.villager.stops[0]
      future_times = bus_stop.future_times(5, Time.zone.parse('3:00 PM'))
      future_times.length.should == 5
      future_times.each { |a| a.should be_a(ActiveSupport::TimeWithZone) }
      future_times.map { |a| a.strftime('%l:%M %p').strip }.should ==
          [
              "3:05 PM", "4:05 PM", "5:05 PM", "6:05 PM", "7:05 PM"
          ]
    end

    it 'should sort list of times in military format and convert to TimeWithZone' do
      sorted_times = BusStop.sort_times(['12:00', '06:55', '13:21', '09:30'])
      sorted_times.each { |a| a.should be_a(ActiveSupport::TimeWithZone) }
      sorted_times.map { |a| a.strftime('%l:%M %p').strip }.should == ["6:55 AM", "9:30 AM", "12:00 PM", "1:21 PM"]
    end

    it 'should sort list of times for an instance' do
      Kihei.villager.stops[0].sorted_times.map { |a| a.strftime('%l:%M %p').strip }.should ==
          [
              "6:05 AM", "7:05 AM", "8:05 AM", "9:05 AM", "10:05 AM",
              "11:05 AM", "12:05 PM", "1:05 PM", "2:05 PM", "3:05 PM",
              "4:05 PM", "5:05 PM", "6:05 PM", "7:05 PM", "8:05 PM"
          ]
    end
  end
end