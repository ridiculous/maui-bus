module ApplicationHelper

  def in_format(the_time)
    the_time.strftime('%l:%M %p')
  end

  def link_to_void(txt, *args)
    link_to(txt.html_safe, 'javascript:;', *args)
  end

  def link_to_static_map(name, coords)
    link_to_void("<i class='icon icon-map-marker'></i>#{name}",
                 title: "Show location of #{name}",
                 class: 'show-static-map',
                 rel: coords)
  end

  def schedule_for(route)
    content_tag(:div, id: "#{route.full_class_name}_container",style: 'display:none;visibility:visible;') do
      concat(content_tag(:h5, 'Times', class: 'bus-schedule-header fl'))
      concat(time_frames(route.full_class_name))
      concat(content_tag(:table, id: "#{route.full_class_name}_table", class: 'table table-striped table-hover bus-stops') do
        content_tag(:tbody) do
          concat(route.visible_stops.map do |vs|
            content_tag(:tr) do
              concat(content_tag(:td, class: 'row-header', style: 'max-width: 200px;font-size:12px;') do
                if Location[vs.location]
                  link_to_static_map(vs.name, Location[vs.location].coords)
                else
                  vs.name
                end
              end)
              concat(route.max_stop_length.times.each_with_index.map do |s, i|
                content_tag(:td, class: "#{route.full_class_name}-time-cell-#{i}") do
                  in_format(Time.zone.parse(vs.times[s])) if vs.times[s]
                end
              end.join.html_safe)
            end
          end.join.html_safe)
        end
      end)
    end
  end

  def morning?
    @_morning ||= Time.zone.now.hour < 12
  end

end
