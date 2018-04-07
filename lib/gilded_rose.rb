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
    if @name == AGED_BRIE
      return aged_brie
    end

    if @name == BACKSTAGE_PASSES
      return backstage_passes
    end

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

  def aged_brie
    @days_remaining = @days_remaining - 1
    return if @quality >= 50

    @quality = @quality + 1

    if @days_remaining <= 0 and @quality < 50
      @quality = @quality + 1
    end
  end

  def backstage_passes
    @days_remaining = @days_remaining - 1
    return if @quality >= 50
    return @quality = 0 if @days_remaining < 0

    @quality = @quality + 1
    if @days_remaining <= 10
      @quality = @quality + 1
    end
    if @days_remaining < 5
      @quality = @quality + 1
    end
  end
end
