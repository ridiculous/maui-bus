module RegionClassMethods

  # i.e Haiku.islander
  def method_missing(method_name, *arguments)
    if new.respond_to?(method_name)
      new.send(method_name)
    else
      super
    end
  end

end