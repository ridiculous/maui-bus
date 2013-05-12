module RegionsHelper

  def stops_as_badges(route)
    route.visible_stops.map do |s|
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

  def upcoming_stops(route)
    path_parts = route.full_class_name.split('_')
    route.next_stops.map do |nxt|
      content_tag(:li, link_to_map("#{in_format(nxt.time)} @ #{nxt.bus_stop.name}", path_parts, nxt.bus_stop.location) + badges(nxt.bus_stop))
    end.join.html_safe
  end
end
