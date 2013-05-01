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

  def schedule_for(my_route, options={})
    render(partial: 'regions/table', locals: {
        options: options.merge(id: "#{my_route.class_name}_table", class: 'table bus-stops'),
        route: my_route
    })
  end
end
