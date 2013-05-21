module ApplicationHelper

  #! DEPRECATED (kinda useful still)
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
      link_to_void(name, options)
    else
      name.html_safe
    end
  end

  # has mobile detection
  def schedule_for(route)
    reset_cycle('times_table')
    content_tag(:div, id: "#{route.full_class_name}_container", style: 'display:none;visibility:visible;') do
      concat(content_tag(:h5, 'Times', class: 'bus-schedule-header fl'))
      concat(time_frames(route.full_class_name))

      # times table
      concat(content_tag(:table, id: "#{route.full_class_name}_table", class: 'table table-hover bus-stops') do
        content_tag(:tbody) do
          concat(route.stops.map do |s|
            if mobile_device?
              mobile_table_rows(route, s)
            else
              table_rows(route, s)
            end
          end.join.html_safe)
        end
      end)
    end
  end

  #
  # NOTE: It takes 1 sec to load the full schedule, of that 500ms is spent here formatting the time :/
  #

  def time_cells(route, stop)
    nxt_ups = route.next_stops_as_hash
    route.max_stop_length.times.each_with_index.map do |s, i|
      my_time = stop.times[s]
      nxt_stop = nxt_ups["#{stop.name}#{my_time}"]
      concat(content_tag(:td, class: "#{route.full_class_name}-time-cell-#{i} #{nxt_stop ? "bus-#{nxt_stop}" : ''}") do
        if my_time && !my_time.empty?
          in_format(Time.zone.parse(my_time))
        end
      end)
    end.join.html_safe
  end

  def table_rows(route, stop)
    path_parts = route.full_class_name.split('_')
    content_tag(:tr, class: cycle('odd', '', name: 'times_table')) do
      concat(content_tag(:td, class: 'row-header') do
        #link_to_static_map(stop.name, stop)
        link_to_map(stop.name, path_parts, stop.location) + badges(stop)
      end)
      time_cells(route, stop)
    end
  end

  def mobile_table_rows(route, stop)
    path_parts = route.full_class_name.split('_')
    content_tag(:tr) do
      content_tag(:td, colspan: stop.times.length, class: 'row-header even') do
        link_to_map(stop.name, path_parts, stop.location) + badges(stop)
      end
    end + content_tag(:tr, class: 'odd') do
      time_cells(route, stop)
    end
  end

  def badges(bus_stop)
    content_tag(:span, 'Destination', class: (bus_stop.destination ? 'badge badge-dest ml5' : 'hide')) +
        content_tag(:span, 'Transfer', class: (bus_stop.transfer? ? 'badge badge-success ml5' : 'hide'))
  end

  def morning?
    @_morning ||= Time.zone.now.hour < 12
  end

  def mobile_device?
    @is_mobile ||= params[:m] || request.user_agent =~ /Mobile|webOS/
  end

  def in_format(the_time)
    the_time.strftime('%l:%M %p') if the_time
  end

  def link_to_void(txt, *args)
    link_to(txt.html_safe, 'javascript:;', *args)
  end

  def link_to_map(txt, region_and_route, location=nil)
    if location
      link_to(txt, show_bus_map_path(*region_and_route, center: location))
    else
      content_tag(:span, txt)
    end
  end

end
