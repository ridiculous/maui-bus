class Region
  LIST = Dir['lib/regions/*.rb'].map { |name| name.match(%r|/(\w+).rb|)[1].titleize }

  attr_reader :routes

  def initialize
    @routes = instance_variables.map { |name| instance_variable_get(name) }
  end

  def find_bus(name)
    self.class.const_get(name.camelcase).new
  rescue NameError
    raise RecordNotFound, "Could not find the route '#{name.camelcase}' for #{self.class}"
  end

  class << self
    def all
      LIST.dup
    end

    def find(name)
      Module.const_get(name.camelcase).new
    rescue NameError
      raise RecordNotFound, 'Could not find the region!'
    end

    def load_all
      all.sort.map { |region| find(region.downcase) }
    end
  end

  class RecordNotFound < StandardError
  end

end