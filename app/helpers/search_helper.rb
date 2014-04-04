module SearchHelper
  def times_for_select
    %w[Now] + ((4..22).to_a + (4..22).to_a).sort.each_with_index.map do |t, i|
      in_format(cycle_hour_and_minutes(t, i).to_time)
    end
  end

  def cycle_hour_and_minutes(t, i)
    "#{pad_hour(t)}:#{i % 2 == 0 ? '00' : '30'}:00"
  end

  def pad_hour(t)
    "#{'0' if t < 10}#{t}"
  end

  def first_flash_message
    request.flash.discard.map { |k, msg| msg }.first
  end

  def all_stops
    bus_stops = []
    Location.unique.each do |key, detail|
      bus_stops << {
        location: key,
        name: detail.to_s,
        lat: detail.lat,
        long: detail.long,
        html: bubble_html(key, detail)
      }
    end
    bus_stops.to_json.html_safe
  end

  def bubble_html(key, detail)
    "<b>#{detail}</b><br />#{search_bubble_links}<br />#{sub_header}<ul>#{routes_for(key).join}</ul>"
  end

  def routes_for(location)
    Bus::Data.routes.select { |route| route.stops_at?(location) }.map do |route|
      content_tag(:li, route.name)
    end
  end

  def search_bubble_links
    '<a href="javascript:;" class="origin">Set as Origin</a><br /><a href="javascript:;" class="destination">Set as Destination</a>'
  end

  def sub_header
    content_tag(:div, 'Routes that stop here:')
  end

  # @locations in format of: [["Kahului - Queen Kaahumanu Mall", :queen_kaahumanu], ...]
  def default_destination
    @locations.find { |x| x[1] == :queen_kaahumanu }
  end

  def default_origin
    @locations.find { |x| x[1] == :kahului_airport }
  end
end