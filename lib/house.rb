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
    @total_area = 0
    @rooms.each do |room|
      @total_area += room.area
    end
    @total_area
  end

  def details
    details_hash = Hash.new
    details_hash["price"] = @price
    details_hash["address"] = @address
    details_hash
  end

  def price_per_square_foot
    area
    (@price.to_f/@total_area.to_f).round(2)
  end

  def rooms_sorted_by_area
    (@rooms.sort_by { |room| room.area}).reverse
  end

  def get_all_from_category(room_category)
    @rooms.select do |room|
      room.category == room_category
    end
  end

  # def rooms_by_category
  #   sort_room_category_hash = {}
  #   @rooms.each do |room|
  #     room_categories = get_all_from_category(room.category)
  #     room_array = []
  #     room.category.each do |room|
  #       room_array << room.category
  #     end
  #     sort_room_category_hash[room.category] = room_array
  #   end
  #   sort_room_category_hash
  # end
end
