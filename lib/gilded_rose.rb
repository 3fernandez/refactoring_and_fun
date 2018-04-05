class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
  AGED_BRIE       = "Aged Brie"
  SULFURAS        = "Sulfuras, Hand of Ragnaros"


  def tick
    if @name != AGED_BRIE and @name != BACKSTAGE_PASSES
      if @quality > 0
        if @name != SULFURAS
          @quality = @quality - 1
        end
      end
    else
      if @quality < 50
        @quality = @quality + 1
        if @name == BACKSTAGE_PASSES
          if @days_remaining < 11
            if @quality < 50
              @quality = @quality + 1
            end
          end
          if @days_remaining < 6
            if @quality < 50
              @quality = @quality + 1
            end
          end
        end
      end
    end
    if @name != SULFURAS
      @days_remaining = @days_remaining - 1
    end
    if @days_remaining < 0
      if @name != AGED_BRIE
        if @name != BACKSTAGE_PASSES
          if @quality > 0
            if @name != SULFURAS
              @quality = @quality - 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality = @quality + 1
        end
      end
    end
  end
end
