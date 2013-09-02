require 'spec_helper'
require 'node_map'

describe NodeMap do

  context 'Wailuku' do
    let(:node_map) { Wailuku.loop_one.node_map }

    it 'should find a bus stop using the node map' do
      s = node_map.find_by_name('kaanapali_beach_club')
      s.parent.name.should == "Kaanapali Islander #25"
      s.parent.parent.name.should == "Lahaina Islander #20"
      s.parent.parent.parent.name.should == "Haiku Islander Route #35"
      s.parent.parent.parent.parent.name.should == "Wailuku Loop Route #1"
      s.parent.parent.parent.parent.parent.should be_nil
    end
  end
end