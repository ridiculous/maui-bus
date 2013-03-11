class BusRoutes

  def initialize
  end

  class << self

    def find(name)
      Module.const_get(name).new
    end

  end
end