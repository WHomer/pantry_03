require 'minitest/autorun'
require './lib/ingredient'

class IngredientTest < MiniTest::Test
  def setup
    @ketchup = Ingredient.new('ketchup', 'oz', 15)
  end

  def test_does_it_exist
    assert_instance_of Ingredient, @ketchup
  end

  def test_does_it_have_a_name
    assert_equal 'ketchup', @ketchup.name
  end

  def test_does_it_have_unit
    assert_equal 'oz', @ketchup.unit
  end

  def test_does_it_have_calories
    assert_equal 15, @ketchup.calories
  end
end