require 'yaml'

module GildedRose
  def self.for(name, days_remaining, quality)
    Object.const_get(klass(name)).new(quality, days_remaining)
  end

  def self.klass(name)
    klasses['specialised'].fetch(name, 'GildedRose::Item')
  end

  def self.klasses
    YAML::load_file(File.join(__dir__, 'items.yml'))
  end

  class Item
    attr_reader :quality, :days_remaining
  
    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end
  
    def tick
    end
  end

  class Normal < Item

    def tick
      @days_remaining -= 1
      return if @quality == 0
      @quality -= 1
      @quality -= 1 if @days_remaining < 0
    end
  end

  class Brie < Item
    def tick
      @days_remaining -= 1
      return if @quality >= 50
  
      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50
    end
  end

  class Backstage < Item
    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
      @quality = 0 if @days_remaining < 0
    end
  end
end
