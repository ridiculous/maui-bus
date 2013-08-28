class Leg

  attr_accessor :name, :start_at, :stop_at

  def initialize(name = nil, start = nil, finish = nil)
    @name = name
    @start_at = start
    @stop_at = finish
  end

  def valid?
    !stop_at.nil? || !start_at.nil?
  end

  def invalid?
    !valid?
  end

  def complete?
    !stop_at.nil? && !start_at.nil?
  end

  def incomplete?
    !complete?
  end

end