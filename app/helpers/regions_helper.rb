module RegionsHelper

  def stops_as_badges(route)
    route.visible_stops.map do |s|
      content_tag(:span, s.name, class: "badge badge-info #{route.class_name}-stop")
    end.uniq.join(' ').html_safe
  end

  def wrap_next_stop(nxt)
    txt = "#{in_format(Time.zone.parse(nxt.time))} @ #{nxt.bus_stop.name}"
    if nxt.coords
      link_to_static_map(txt, nxt.coords)
    else
      txt
    end
  end
end
