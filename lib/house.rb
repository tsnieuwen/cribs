class House
attr_reader :price,
            :address,
            :rooms

  def initialize(price, address)
    @price = (price.delete"$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room_to_be_added)
    @rooms << room_to_be_added
  end

  def above_market_average?
    true if @price > 500000
  end

  def rooms_from_category(room_category)
    rooms_in_category = []
    @rooms.each do |room|
      if room.category == room_category
        rooms_in_category << room
      end
    end
      rooms_in_category
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
    details_hash = Hash.new
    details_hash["price"] = @price
    details_hash["address"] = @address
    details_hash
  end

end
