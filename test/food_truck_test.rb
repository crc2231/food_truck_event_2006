require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/food_truck"

class FoodTruckTest < Minitest::Test

  def setup
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
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

  def test_it_shows_inventory
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)

    expected = {@item1 => 55, @item2 => 12}
  end

  def test_potential_revenue
    @food_truck.stock(@item1, 35)
    @food_truck.stock(@item2, 7)

    assert_equal 148.75,@food_truck.potential_revenue
  end

end
