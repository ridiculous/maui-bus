module RegionsHelper

  def stops_as_badges(route)
    route.stops.map do |s|
      content_tag(:span, s.name, class: "badge badge-info #{route.full_class_name}-stop")
    end.uniq.join(' ').html_safe
  end

  def time_frames(route_name)
    content_tag(:ul, class: 'nav nav-pills schedule-nav-pills') do
      content_tag(:li, link_to_void('Morning', class: 'time-frame morning', rel: route_name), class: ('active' if morning?)) +
          content_tag(:li, link_to_void('Afternoon', class: 'time-frame afternoon', rel: route_name), class: ('active' unless morning?)) +
          content_tag(:li, link_to_void('All', class: 'time-frame all', rel: route_name))
    end
  end

  def upcoming_stops(bus)
    bus.map { |nxt|
      content_tag(:li) {
        link_to_map(time_at_name(nxt.time, nxt.bus_stop.name), nxt.path_parts, nxt.bus_stop.location) + badges(nxt.bus_stop)
      }
    }.join.html_safe
  end

  def all_stops
    Location.unique.map { |key, detail| {location: key, name: detail.to_s, lat: detail.lat, long: detail.long} }.to_json.html_safe
  end

  def upcoming_stops_box(route)
    route.next_stops_cache.each_with_index.map do |stops, i|
      content_tag(:div, class: "fl mr15 bus-#{i + 1}") do
        content_tag(:h5, "Upcoming Stops#{(content_tag(:span, " - Bus #{i + 1}") if route.next_stops_cache.length > 1)}".html_safe, class: 'well mini') +
            content_tag(:ul, stops.any? ? upcoming_stops(stops) : content_tag(:li, 'Nothing going on here'), class: 'mba-list')
      end
    end.join.html_safe
  end

  def icon(css_class, name)
    "<span class='icon icon-#{css_class}'></span>#{name}".html_safe
  end

  def icon_times
    icon('time', 'Times')
  end

  def icon_map
    icon('globe', 'Map')
  end
end
