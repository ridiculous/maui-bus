require 'spec_helper'

describe 'Region', js: true do

  context 'Time management with JavaScript' do

    let(:show_islander) { page.find('.time-list[rel=haiku_islander]') }

    context 'desktop', js: true do
      before(:each) { visit show_region_path('haiku', anchor: 'haiku_islander') }

      it 'should toggle times' do
        show_islander.click
        page.should have_css('#haiku_islander_container', visible: false)
        show_islander.click
        page.should have_css('#haiku_islander_container', visible: true)
        show_islander.click
        page.should have_css('#haiku_islander_container', visible: false)
      end

      it 'should filter times by time-frame (morning and evening)' do
        assert_time_frame_change
      end

      it 'should start with appropriate default time-frame' do
        page.should have_css('#haiku_islander_container', visible: true)
        is_morning = Time.zone.now.hour < 12
        time_frame = is_morning ? 'morning' : 'afternoon'
        ex_time = is_morning ? '5:30 AM' : '7:00 PM'
        page.should have_css("#haiku_islander_container li.active .#{time_frame}")
        page.has_text?(:visible, ex_time).should be_truthy
      end
    end

    context 'mobile', js: true do
      before(:each) { visit show_region_path('haiku', m: 1, anchor: 'haiku_islander') }

      it 'should filter times by time-frame (morning, afternoon, and evening)' do
        assert_time_frame_change
      end
    end
  end
end