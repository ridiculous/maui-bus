require 'spec_helper'

describe Detail do
  let(:latitude) { 20.88657 }
  let(:longitude) { -156.475375 }

  subject { Detail.new(latitude, longitude, 'Queen Kaahumanu Mall', 96732, true) }

  its(:lat) { should == latitude }
  its(:long) { should == longitude }
  its(:name) { should == 'Queen Kaahumanu Mall' }
  its(:zip) { should == 96732 }
  its(:transfer) { should == true }
  its(:transfer?) { should == true }
  its(:coords) { should == "#{latitude},#{longitude}" }
  its(:to_s) { should == "#{Location::ZIP_CODES[subject.zip]} - #{subject.name}" }

  context '#distance_to' do
    it 'should return distance in miles to another point' do
      subject.distance_to(Location.find(:makena)).should == 16.725883649694456
      subject.distance_to(Location.find(:kahului_safeway)).should == 0.7522334515958067
    end
  end
end