
module RegionClassMethods

  # i.e Haiku.islander
  def method_missing(method_name, *arguments)
    if new.respond_to?(method_name)
      new.send(method_name)
    else
      super
    end
  end

  # Lahaina.last_stop_time(:villager) #=> 23:00:00 -1000
  def last_stop_time(name=:islander)
    send(name).stops.map(&:times).flatten.reject(&:empty?).map(&:to_time).last
  end

end