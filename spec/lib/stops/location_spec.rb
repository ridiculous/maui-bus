require 'spec_helper'

describe Location do
  context '#find' do
    it 'should return the location details' do
      Location.find(:makena).should be_a Detail
      Location.find(:makena).name.should == 'Makena'
    end

    it 'should be aliased to []' do
      Location[:makena].should be_a Detail
      Location[:makena].name.should == 'Makena'
    end
  end

  context '#all' do
    it 'should return all locations' do
      key = :haiku_community_center
      Location.all.length.should == 176
      Location.all.first.should == [key, Location[key]]
      Location.all[key].should == Location[key]
    end
  end

  context '#unique' do
    let(:all) { Location.all }
    let(:unique) { Location.unique }

    it 'should reject locations ending with "across"' do
      all[:kahului_community_center_across].should be_present
      unique[:kahului_community_center_across].should be_nil
    end

    it 'should reject locations ending with "parkside"' do
      all[:lihi_kanaloa_ave_parkside].should be_present
      unique[:lihi_kanaloa_ave_parkside].should be_nil
    end

    it 'should reject locations ending with "makai"' do
      all[:hawaiian_homes_makai].should be_present
      unique[:hawaiian_homes_makai].should be_nil
    end

    it 'should reject locations ending with "mauka"' do
      all[:uwapo_south_kihei_mauka].should be_present
      unique[:uwapo_south_kihei_mauka].should be_nil
    end
  end

  context '#find_with_coordinates' do
    subject(:locations) { Location.find_with_coordinates(20.89267, -156.49909) }
    its(:length) { should == 4 }
    its(:first) { should be_a Location::Nearby }

    it 'should find stops within the threshold' do
      nearby = locations.first
      nearby.distance.should == 0.08818840244985414
      nearby.name.should == :wailuku_post_office
      nearby.detail.should == Location[:wailuku_post_office]
    end

    it 'should be sorted by closest bus stop' do
      locations[0].distance.should be < locations[1].distance
      locations[1].distance.should be < locations[2].distance
      locations[2].distance.should be < locations[3].distance
    end

    it 'should return an empty array when nothing found' do
      Location.find_with_coordinates(20.89267, -56.49909).should == []
    end
  end
end