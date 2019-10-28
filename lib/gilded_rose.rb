require 'normal'
require 'brie'
require 'item'
require 'backstage'
require 'brie'
require 'backstage'
# require 'normal'

require 'yaml'

module GildedRose
  def self.for(name, days_remaining, quality)
    Object.const_get(klass(name)).new(quality, days_remaining)
  end

  def self.klass(name)
    klasses['specialised'].fetch(name, 'Item')
  end

  def self.klasses
    YAML::load_file(File.join(__dir__, 'items.yml'))
  end
end
