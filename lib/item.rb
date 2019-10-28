class Item
  attr_reader :quality, :days_remaining

  def initialize(quality, days_remaining)
    @quality, @days_remaining = quality, days_remaining
  end

  def tick
  end
end