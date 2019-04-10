require 'minitest/autorun'
require './lib/recipe'

class RecipeTest < MiniTest::Test

  def setup
    @cookies = Recipe.new('cookies')
    @ketchup = Ingredient.new('ketchup', 'oz', 15)
  end

  def test_does_it_exist
    assert_instance_of Recipe, @cookies
  end

  def test_does_it_have_a_name
    assert_equal 'cookies', @cookies.name
  end

  def test_does_it_have_empty_array_of_ingredients
    assert_equal [], @cookies.ingredients
  end

  def test_can_you_add_an_ingredient
    assert_equal [[@ketchup, 2]], @cookies.add_ingredient(@ketchup, 2)
  end

  def test_can_it_return_a_list_of_all_ingredients
    @cookies.add_ingredient(@ketchup, 2)
    assert_equal [@ketchup], @cookies.list_of_ingredients
  end

  def test_can_it_return_the_quantity_needed_for_an_ingredient
    @cookies.add_ingredient(@ketchup, 2)
    assert_equal 2, @cookies.quantity_of_ingredient(@ketchup)
  end

  def test_can_it_return_the_total_number_of_calories
    @cookies.add_ingredient(@ketchup, 2)
    assert_equal 15, @cookies.total_calories
  end
end