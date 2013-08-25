require 'spec_helper'
require 'trip'

describe Trip do

  context 'Direct Routes' do
    let(:current_time) { Time.zone.parse('12:00:00') }
    let(:trip) { Trip.new('kahului_airport', 'queen_kaahumanu') }

    it 'should find direct routes' do
      trip.find_direct_routes(current_time)
      trips = trip.prioritize
      trips.length.should == 2
      trips.each do |t|
        t.should be_a(DirectRoute)
      end
      option1 = trips[0]
      option1.start_at.bus_stop.name.should == "Airport Pick-up Zone #3"
      option1.start_at.time.should == Time.zone.parse('12:43:00')
      option1.stop_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      option1.stop_at.time.should == Time.zone.parse('13:00:00')
      (option1.stop_at.time > option1.start_at.time).should be_true

      option2 = trips[1]
      option2.start_at.bus_stop.name.should == "Airport Pick-up Zone #3"
      option2.start_at.time.should == Time.zone.parse('13:11:00')
      option2.stop_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      option2.stop_at.time.should == Time.zone.parse('13:30:00')
      (option2.stop_at.time > option2.start_at.time).should be_true
    end

    it 'should sort by the fastest route' do
      trip.find_direct_routes(current_time)
      trips = trip.prioritize.sort_by { |x| x.stop_at.time }
      trips.first.start_at.time.should == Time.zone.parse('12:43:00')
    end
  end

  context 'Indirect Routes' do
    let(:trip) { Trip.new('liholiho_kanaloa_ave', 'alana_place_makawao') }
    let(:current_time) { Time.zone.parse('13:00:00') }

    it 'should find indirect routes with transfers' do
      trip.find_direct_routes(current_time)
      direct_trips = trip.prioritize
      direct_trips.should be_empty
      id_routes = trip.find_indirect_routes(current_time)
      id_routes.length.should == 2
      id_routes.each { |route| route.should be_a(IndirectRoute) }
      idr1 = id_routes[0]
      idr1.point_a.should be_a(DirectRoute)
      idr1.point_a.start_at.bus_stop.name.should == "Liholiho St. / Kanaloa Ave."
      idr1.point_a.start_at.time.should == Time.zone.parse('13:20:00')
      idr1.point_a.stop_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      idr1.point_a.stop_at.time.should == Time.zone.parse('13:30:00')
      idr1.should have(1).point_bs
      idr1.point_bs.first.start_at.bus_stop.name.should == 'Queen Kaahumanu Mall'
      idr1.point_bs.first.start_at.time.should == Time.zone.parse('13:30:00')
      idr1.point_bs.first.stop_at.time.should == Time.zone.parse('14:06:00')
      idr1.point_bs.first.stop_at.bus_stop.name.should == "Alana Place / Makawao Ave"
      # option 2
      idr2 = id_routes[1]
      idr2.point_a.should be_a(DirectRoute)
      idr2.point_a.start_at.bus_stop.name.should == "Liholiho St. / Kanaloa Ave. (Parkside)"
      idr2.point_a.start_at.time.should == Time.zone.parse('13:07:00')
      idr2.point_a.stop_at.bus_stop.name.should == "Queen Kaahumanu Mall"
      idr2.point_a.stop_at.time.should == Time.zone.parse('14:00:00')
      idr2.should have(1).point_bs
      idr2.point_bs.first.start_at.bus_stop.name.should == 'Queen Kaahumanu Mall'
      idr2.point_bs.first.start_at.time.should == Time.zone.parse('15:00:00')
      idr2.point_bs.first.stop_at.time.should == Time.zone.parse('15:36:00')
      idr2.point_bs.first.stop_at.bus_stop.name.should == "Alana Place / Makawao Ave"
    end

  end

  context 'Voyages' do
    let(:trip) { Trip.new('liholiho_kanaloa_ave', 'lahaina_cannery_mall') }
    let(:current_time) { Time.zone.parse('13:00:00') }

    it 'should create a 3 step voyage if all else fails' do
      trip.find_indirect_routes(current_time)
      a = trip.find_voyages(current_time)
      v = a[0]
      voyage_times = [v.leg_1.start_at.time, v.leg_1.stop_at.time, v.leg_2.start_at.time, v.leg_2.stop_at.time, v.leg_3.start_at.time, v.leg_3.stop_at.time]
      valid_times = [
          Time.zone.parse('13:20:00'),
          Time.zone.parse('13:30:00'),
          Time.zone.parse('13:30:00'),
          Time.zone.parse('14:30:00'),
          Time.zone.parse('14:30:00'),
          Time.zone.parse('14:50:00')
      ]
      voyage_times.should == valid_times
    end
  end

end