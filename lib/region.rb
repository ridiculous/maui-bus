class Region

  LIST = Dir.open('lib/regions').reject { |t| t !~ /rb/ }.map { |name| name.sub(%r{.rb}, '').titleize }

  attr_reader :routes

  def initialize
    @routes = self.instance_variables.map { |name| self.instance_variable_get(name) }
  end

  def find_bus(name)
    self.class.const_get(name.titleize).new
  end

  class << self
    def all
      LIST.dup
    end

    def find(name)
      Module.const_get(name.titleize).new
    end

    def load_all
      all.sort.map { |region| Region.find(region.downcase) }
    end
  end

end