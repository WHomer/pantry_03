require 'minitest/autorun'
require './lib/pantry'

class PantryTest < MiniTest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new('Cheese', "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_does_it_exist
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_empty_hash_of_stock
    assert_equal Hash.new, @pantry.stock
  end

  def test_stock_check_with_ingredient_object
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_you_can_restock_an_ingredient_object_and_stock_increases
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients_for_recipe?
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    refute @pantry.test_enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 8)
    assert @pantry.test_enough_ingredients_for?(@mac_and_cheese)
  end




end