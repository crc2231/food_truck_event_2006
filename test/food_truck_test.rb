require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/food_truck"

class FoodTruckTest < Minitest::Test

  def setup
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  def test_it_exists
    assert_instance_of FoodTruck, @food_truck
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Pies", @food_truck.name
  end

  def test_inventory_starts_empty

    expected = {}
    assert_equal expected, @food_truck.inventory
  end

  def test_it_can_stock_item
    @food_truck.stock(@item1, 30)

    expected = {@item1 => 30}

    assert_equal expected, @food_truck.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @food_truck.check_stock(@item1)

    @food_truck.stock(@item1, 30)

    assert_equal 30, @food_truck.check_stock(@item1)

    @food_truck.stock(@item1, 25)

    assert_equal 55, @food_truck.check_stock(@item1)
  end

end
