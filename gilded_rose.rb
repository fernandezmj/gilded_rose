class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_item(item)    
    end
  end

  private

  def update_item(item)
    
    item.sell_in -= 1

    case

    when item.name == "Aged Brie"
      return unless item.quality < 50
        item.quality += 1

    when item.name == "Backstage passes to a TAFKAL80ETC concert"
      return unless item.quality < 50

      if item.sell_in < 0
        item.quality = 0    

      elsif item.sell_in < 6  
        item.quality += 3

      elsif item.sell_in < 11
        item.quality += 2

      else
        item.quality += 1
      end 

    # when /conjured/.match('conjured item')
    #   if item.sell_in > 0
    #     item.quality -= 2
    #   else
    #     item.quality -= 4
    #   end
            
    else
      if item.sell_in > 0
        item.quality -= 1
      else
        item.quality -= 2    
      end
    end
    
    if item.quality < 0 
      item.quality = 0
    elsif item.quality > 50
      item.quality = 50
    end

  end  
end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
