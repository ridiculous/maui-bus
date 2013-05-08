module ApplicationHelper

  def in_format(the_time)
    the_time.strftime('%l:%M %p')
  end

  def link_to_void(txt, *args)
    link_to(txt.html_safe, 'javascript:;', *args)
  end

  # @param name String
  # @param bus_stop BusStop
  def link_to_static_map(name, bus_stop)
    bus_stop_location = Location[bus_stop.location]
    options = {
        title: "Show location of #{name}",
        class: 'show-static-map'
    }

    if bus_stop_location
      options[:rel] = bus_stop_location.coords
      link_to_void("<i class='icon icon-map-marker'></i>#{name}", options)
    else
      name
    end
  end

  def mobile_device?
    @is_mobile ||= request.user_agent =~ /Mobile|webOS/
  end

  # mobile detection needs refactoring or something ... Ugh
  def schedule_for(route)
    reset_cycle('times_table')
    content_tag(:div, id: "#{route.full_class_name}_container", style: 'display:none;visibility:visible;') do
      concat(content_tag(:h5, 'Times', class: 'bus-schedule-header fl'))
      concat(time_frames(route.full_class_name))

      # times table
      concat(content_tag(:table, id: "#{route.full_class_name}_table", class: 'table table-hover bus-stops') do
        content_tag(:tbody) do
          concat(route.visible_stops.map do |vs|
            content_tag(:tr, class: ('hidden' unless mobile_device?)) do
              # full span row header
              content_tag(:td, colspan: vs.times.length, class: 'row-header even') do
                link_to_static_map(vs.name, vs) if mobile_device?
              end
            end +
            content_tag(:tr, class: "#{mobile_device? ? 'odd' : cycle('odd', '', name: 'times_table')}") do

              # row header
              unless mobile_device?
                concat(content_tag(:td, class: 'row-header') do
                  link_to_static_map(vs.name, vs)
                end)
              end

              # time cells
              route.max_stop_length.times.each_with_index.map do |s, i|
                css_class = "#{route.full_class_name}-time-cell-#{i}"
                concat(content_tag(:td, class: css_class) do
                  in_format(Time.zone.parse(vs.times[s])) if vs.times[s]
                end)
              end.join.html_safe

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
