module RegionsHelper

  def stops_as_badges(route)
    route.visible_stops.map do |s|
      content_tag(:span, s.name, class: "badge badge-info #{route.full_class_name}-stop")
    end.uniq.join(' ').html_safe
  end

  def wrap_next_stop(nxt)
    link_to_static_map("#{in_format(nxt.time)} @ #{nxt.bus_stop.name}", nxt.bus_stop)
  end

  def time_frames(route_name)
    content_tag(:ul, class: 'nav nav-pills schedule-nav-pills') do
      content_tag(:li, link_to_void('Morning', class: 'time-frame morning', rel: route_name), class: ('active' if morning?)) +
          content_tag(:li, link_to_void('Afternoon', class: 'time-frame afternoon', rel: route_name), class: ('active' unless morning?)) +
          content_tag(:li, link_to_void('All', class: 'time-frame all', rel: route_name))
    end
  end
end
