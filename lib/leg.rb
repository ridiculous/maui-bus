class Leg

  attr_accessor :start_at, :stop_at, :transfers, :order

  def initialize(start = nil, finish = nil, trnsfers = [])
    @start_at = start
    @stop_at = finish
    @transfers = trnsfers
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