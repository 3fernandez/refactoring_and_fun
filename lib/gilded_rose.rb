class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  AGED_BRIE       = "Aged Brie"
  SULFURAS        = "Sulfuras, Hand of Ragnaros"
  NORMAL          = "Normal Item"
  CONJURED        = "Conjured Mana Cake"

  def tick
    case @name
    when AGED_BRIE
      return aged_brie
    when BACKSTAGE_PASS
      return backstage_pass
    when NORMAL
      return normal
    when CONJURED
      return conjured
    else
      return
    end
  end

  def aged_brie
    @days_remaining = @days_remaining - 1
    return if @quality >= 50

    @quality = @quality + 1
    @quality = @quality + 1 if @days_remaining <= 0 and @quality < 50
  end

  def backstage_pass
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

  def normal
    @days_remaining = @days_remaining - 1

    if @quality == 0
      return
    else
      @quality = @quality - 1

      if @days_remaining <= 0
        @quality = @quality - 1
      end
    end
  end

  def conjured
    @days_remaining = @days_remaining - 1

    if @quality == 0
      return
    else
      @quality = @quality - 2

      if @days_remaining <= 0
        @quality = @quality - 2
      end
    end
  end
end
