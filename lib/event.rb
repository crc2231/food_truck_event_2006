require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all {|truck| truck.inventory.include?(item)}
  end

  def total_inventory
    tot_inventory = Hash.new { |hash, key| hash[key] = {quantity: 0, food_trucks: []} }
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        tot_inventory[item][:quantity] += amount
        tot_inventory[item][:food_trucks] << truck
      end
    end
    tot_inventory
  end

  def overstocked_items
    items = []
    total_inventory.each_key do |item|
      if total_inventory[item][:quantity] > 50 && total_inventory[item][:food_trucks].count > 1
        items << item
      end
    end
    items
  end

  def sorted_item_list
    item_collection = total_inventory.keys
    item_collection.map do |item|
      item.name
    end.uniq.sort
  end
end
