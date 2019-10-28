
require "spec_helper"

require_relative "../lib/item_finder"

RSpec.describe ItemFinder do
  context "Normal Item" do
    it "before sell date" do
      rose = ItemFinder.new(name: "Normal Item", days_remaining: 5, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 4, quality: 9)
    end

    it "on sell date" do
      rose = ItemFinder.new(name: "Normal Item", days_remaining: 0, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -1, quality: 8)
    end

    it "after sell date" do
      rose = ItemFinder.new(name: "Normal Item", days_remaining: -10, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -11, quality: 8)
    end

    it "of zero quality" do
      rose = ItemFinder.new(name: "Normal Item", days_remaining: 5, quality: 0)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 4, quality: 0)
    end
  end

  context "Aged Brie" do
    it "before sell date" do
      rose = ItemFinder.new(name: "Aged Brie", days_remaining: 5, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 4, quality: 11)
    end

    it "with max quality" do
      rose = ItemFinder.new(name: "Aged Brie", days_remaining: 5, quality: 50)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 4, quality: 50)
    end

    it "on sell date" do
      rose = ItemFinder.new(name: "Aged Brie", days_remaining: 0, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -1, quality: 12)
    end

    it "on sell date near max quality" do
      rose = ItemFinder.new(name: "Aged Brie", days_remaining: 0, quality: 49)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -1, quality: 50)
    end

    it "on sell date with max quality" do
      rose = ItemFinder.new(name: "Aged Brie", days_remaining: 0, quality: 50)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -1, quality: 50)
    end

    it "after sell date" do
      rose = ItemFinder.new(name: "Aged Brie", days_remaining: -10, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -11, quality: 12)
    end

    it "after sell date with max quality" do
      rose = ItemFinder.new(name: "Aged Brie", days_remaining: -10, quality: 50)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -11, quality: 50)
    end
  end

  context "Sulfuras" do
    it "before sell date" do
      rose = ItemFinder.new(name: "Sulfuras, Hand of Ragnaros", days_remaining: 5, quality: 80)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 5, quality: 80)
    end

    it "on sell date" do
      rose = ItemFinder.new(name: "Sulfuras, Hand of Ragnaros", days_remaining: 0, quality: 80)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 0, quality: 80)
    end

    it "after sell date" do
      rose = ItemFinder.new(name: "Sulfuras, Hand of Ragnaros", days_remaining: -10, quality: 80)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -10, quality: 80)
    end
  end

  context "Backstage Pass" do
    it "long before sell date" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 11, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 10, quality: 11)
    end

    it "long before sell date at max quality" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 11, quality: 50)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 10, quality: 50)
    end

    it "medium close to sell date upper bound" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 10, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 9, quality: 12)
    end

    it "medium close to sell date upper bound at max quality" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 10, quality: 50)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 9, quality: 50)
    end

    it "medium close to sell date lower bound" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 6, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 5, quality: 12)
    end

    it "medium close to sell date lower bound at max quality" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 6, quality: 50)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 5, quality: 50)
    end

    it "very close to sell date upper bound" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 5, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 4, quality: 13)
    end

    it "very close to sell date upper bound at max quality" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 5, quality: 50)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 4, quality: 50)
    end

    it "very close to sell date lower bound" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 1, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 0, quality: 13)
    end

    it "very close to sell date lower bound at max quality" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 1, quality: 50)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 0, quality: 50)
    end

    it "on sell date" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: 0, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -1, quality: 0)
    end

    it "after sell date" do
      rose = ItemFinder.new(name: "Backstage passes to a TAFKAL80ETC concert", days_remaining: -10, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -11, quality: 0)
    end
  end

  context "Conjured Mana" do
    xit "before sell date" do
      rose = ItemFinder.new(name: "Conjured Mana Cake", days_remaining: 5, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 4, quality: 8)
    end

    xit "before sell date at zero quality" do
      rose = ItemFinder.new(name: "Conjured Mana Cake", days_remaining: 5, quality: 0)

      rose.tick

      expect(rose).to have_attributes(days_remaining: 4, quality: 0)
    end

    xit "on sell date" do
      rose = ItemFinder.new(name: "Conjured Mana Cake", days_remaining: 0, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -1, quality: 6)
    end

    xit "on sell date at zero quality" do
      rose = ItemFinder.new(name: "Conjured Mana Cake", days_remaining: 0, quality: 0)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -1, quality: 0)
    end

    xit "after sell date" do
      rose = ItemFinder.new(name: "Conjured Mana Cake", days_remaining: -10, quality: 10)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -11, quality: 6)
    end

    xit "after sell date at zero quality" do
      rose = ItemFinder.new(name: "Conjured Mana Cake", days_remaining: -10, quality: 0)

      rose.tick

      expect(rose).to have_attributes(days_remaining: -11, quality: 0)
    end
  end
end