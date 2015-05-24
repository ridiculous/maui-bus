#
#= Helpers
#

def assert_time_frame_change
  page.should have_css('#haiku_islander_container', visible: true)
  click_on('Morning')
  assert_morning_active
  click_on('Afternoon')
  assert_afternoon_active
  click_on('All')
  assert_all_active
end

def assert_morning_active
  (0..4).each { |n| assert_visible_row(n) }
  page.should have_css(".haiku_islander-time-cell-5", count: 16, visible: false)
  page.has_text?(:visible, '5:30 AM').should be_truthy
  page.has_text?(:visible, '1:00 PM').should be_truthy
end

def assert_afternoon_active
  page.should have_css(".haiku_islander-time-cell-1", count: 16, visible: false)
  (4..10).each { |n| assert_visible_row(n) }
  page.has_text?(:visible, '5:30 AM').should be_falsey
  page.has_text?(:visible, '6:11 AM').should be_falsey
  page.has_text?(:visible, '1:00 PM').should be_truthy
  page.has_text?(:visible, '7:00 PM').should be_truthy
end

def assert_all_active
  (0..10).each { |n| assert_visible_row(n) }
  page.has_text?(:visible, '5:30 AM').should be_truthy
  page.has_text?(:visible, '7:00 PM').should be_truthy
end

def assert_visible_row(n)
  page.should have_css(".haiku_islander-time-cell-#{n}", count: 16, visible: true)
end