require './lib/recipe'
require './lib/ingredient'
class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(input_ingredient)
    result = @stock.find{|ingredient| ingredient[0] == input_ingredient}
    return 0 if result.nil?
    result.last
  end

  def restock(input_ingredient, quantity)
    @stock[input_ingredient] = 0 if @stock[input_ingredient].nil? 
    @stock[input_ingredient] += quantity 
  end

  def test_enough_ingredients_for?(recipe)
    recipe.list_of_ingredients.each do |ingredient|
      quantity_for_recipe = recipe.quantity_of_ingredient(ingredient)
      quantity_in_stock = stock_check(ingredient)
      return false if quantity_for_recipe > quantity_in_stock
    end
    return true
  end
end