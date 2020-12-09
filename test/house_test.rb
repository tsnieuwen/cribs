require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_has_readable_attributes
    house = House.new("$400000", "123 sugar lane")
    assert_equal 400000, house.price
    assert_equal "123 sugar lane", house.address
    assert_equal [], house.rooms
  end

  def test_it_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)
    expected = [room_1, room_2]
    assert_equal expected, house.rooms
  end

  def test_above_market_average_false
    house = House.new("$400000", "123 sugar lane")
    refute house.above_market_average?
  end

  def test_above_market_average_true
    house = House.new("$800000", "123 sugar lane")
    assert house.above_market_average?
  end

  def test_rooms_from_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    expected = [room_1, room_2]
    assert_equal expected, house.rooms_from_category(:bedroom)
  end

  def test_house_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    assert_equal 1900, house.area
  end

  def test_house_details
    house = House.new("$400000", "123 sugar lane")
    expected = {"price" => 400000, "address" => "123 sugar lane"}
    assert_equal expected, house.details
  end

  def test_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)
    assert_equal 210.53, house.price_per_square_foot
  end

  def test_sort_rooms_by_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)
    expected = [room_4, room_3, room_2, room_1]
    assert_equal expected, house.rooms_sorted_by_area
  end

  def test_get_all_from_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)
    expected = [room_1, room_2]
    assert_equal expected, house.get_all_from_category(:bedroom)
  end


  # def test_rooms_sort_rooms_by_category
  #   house = House.new("$400000", "123 sugar lane")
  #   room_1 = Room.new(:bedroom, 10, '13')
  #   room_2 = Room.new(:bedroom, 11, '15')
  #   room_3 = Room.new(:living_room, 25, '15')
  #   room_4 = Room.new(:basement, 30, '41')
  #   house.add_room(room_4)
  #   house.add_room(room_1)
  #   house.add_room(room_3)
  #   house.add_room(room_2)
  #   expected = {:bedroom => [room_1, room_2], :living_room => [room_3], :basement => [room_4]}
  #   assert_equal expected, house.rooms_by_category
  # end


end
