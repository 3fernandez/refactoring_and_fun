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
    decrease_days_remaining_by_one
    return if @quality >= 50

    increase_quality_by_one
    increase_quality_by_one if @days_remaining <= 0 and @quality < 50
  end

  def backstage_pass
    decrease_days_remaining_by_one
    return if @quality >= 50
    return @quality = 0 if @days_remaining < 0

    increase_quality_by_one
    increase_quality_by_one if @days_remaining <= 10
    increase_quality_by_one if @days_remaining < 5
  end

  def normal
    decrease_days_remaining_by_one
    return if @quality == 0

    decrease_quality_by(1)
    decrease_quality_by(1) if @days_remaining <= 0
  end

  def conjured
    decrease_days_remaining_by_one
    return if @quality == 0

    decrease_quality_by(2)
    decrease_quality_by(2) if @days_remaining <= 0
  end

  def decrease_days_remaining_by_one
    @days_remaining -= 1
  end

  def increase_quality_by_one
    @quality += 1
  end

  def decrease_quality_by(amount)
    @quality -= amount
  end
end
