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

  def schedule_for(my_route, html_options={})
    render(partial: 'regions/table', locals: {
        html_options: html_options.merge(id: "#{my_route.full_class_name}_container"),
        route: my_route
    })
  end

  def morning?
    @_morning ||= Time.zone.now.hour < 12
  end

end
