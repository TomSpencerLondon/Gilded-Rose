require 'gilded_rose'

class ItemFinder
  attr_reader :rose

  def initialize(name:, days_remaining:, quality:)
    @rose = GildedRose.for(name, days_remaining, quality)
  end

  def tick
    @rose.tick
  end

  def quality
    @rose.quality
  end

  def days_remaining
    @rose.days_remaining
  end
end
