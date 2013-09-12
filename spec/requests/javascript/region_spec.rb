require 'spec_helper'

describe 'Region', js: true do

  describe 'Time management with JavaScript', js: true do

    before(:each) { visit show_region_path('haiku') }

    it 'should toggle times' do
      show_haiku = find('.time-list[rel=haiku_islander]')
      show_haiku.click
      page.should have_css('#haiku_islander_container', visible: false)
      show_haiku.click
      page.should have_css('#haiku_islander_container', visible: true)
      show_haiku.click
      page.should have_css('#haiku_islander_container', visible: false)
    end

    it 'should filter times by time-frame (morning and evening)' do
      page.should have_css('#haiku_islander_container', visible: true)
      click_on('Morning')
      page.has_text?(:visible, '5:30 AM').should be_true
      click_on('Afternoon')
      page.has_text?(:visible, '6:11 AM').should be_false
      page.has_text?(:visible, '7:00 PM').should be_true
      click_on('All')
      page.has_text?(:visible, '5:30 AM').should be_true
      page.has_text?(:visible, '7:00 PM').should be_true
    end

    it 'should start with appropriate default time-frame' do
      page.should have_css('#haiku_islander_container', visible: true)
      is_morning = Time.zone.now.hour < 12
      time_frame = is_morning ? 'morning' : 'afternoon'
      ex_time = is_morning ? '5:30 AM' : '7:00 PM'
      page.should have_css("#haiku_islander_container li.active .#{time_frame}")
      page.has_text?(:visible, ex_time).should be_true
    end
  end
end