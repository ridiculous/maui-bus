class Region

  LIST = Dir.open('lib/regions').reject { |t| t !~ /rb/ }.map { |name| name.sub(%r{.rb}, '').titleize }

  attr_reader :routes

  def initialize
    @routes = self.instance_variables.map { |name| self.instance_variable_get(name) }
  end

  def self.all
    LIST.dup
  end

  def self.find(name)
    Module.const_get(name.titleize).new
  end

end