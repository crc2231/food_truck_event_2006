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
  end

end
