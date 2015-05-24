require 'spec_helper'

describe Bus::Route do

  context 'class methods' do
    it 'should #load_stops for a bus route' do
      Lahaina::Islander.reset_stops # avoid warning of constant already set
      Bus::Route.load_stops(Lahaina::Islander)
      stops = Lahaina::Islander.const_get(:STOPS)
      stops.length.should == 9
      stops.first.should be_a Bus::Stop
      stops.first.times.should == %w(5:30 6:30 7:30 8:30 9:30 10:30 11:30 12:30 13:30 14:30 15:30 16:30 17:30 18:30 19:30)
    end
  end

  context 'child class' do
    subject { Lahaina.new.islander }

    its(:class_name) { should == 'islander' }
    its(:full_class_name) { should == 'lahaina_islander' }
    its(:path_parts) { should == %w(lahaina islander) }
    its(:underscore_name) { should == "lahaina/islander" }
    its(:locations) { should == %w(queen_kaahumanu state_bldg_wells_st waikapu maalaea_harbor wharf_cinema maalaea_harbor waikapu state_bldg queen_kaahumanu) }
    its(:transfer_locations) { should == %w(queen_kaahumanu maalaea_harbor wharf_cinema) }
    its(:max_stop_length) { should == 15 }

    it 'should have an operator' do
      subject.operator.should be_a Bus::Operator
    end

    it 'should delegate to the operator' do
      subject.should respond_to :find_between
      subject.should respond_to :next_stops
      subject.should respond_to :next_stops_as_hash
    end

    it 'should know where it stops_at?' do
      subject.stops_at?(:queen_kaahumanu).should be_truthy
      subject.stops_at?(:maalaea_harbor).should be_truthy
      subject.stops_at?(:kahului_safeway).should be_falsey
    end

    context 'caching #next_stops' do
      it 'should load cache when #next_stops_cache is empty' do
        subject.clear_cache
        subject.operator.should_receive(:next_stops)
        subject.next_stops_cache
      end

      it 'should use cache when present' do
        subject.instance_variable_set(:@next_stops_cache, [])
        subject.operator.should_not_receive(:next_stops)
        subject.next_stops_cache
      end
    end
  end
end