require './lib/ingredient'
require 'pry'

class Recipe
  attr_reader :name,
              :ingredients

  def initialize(name)
    @name = name
    @ingredients = []
  end

  def add_ingredient(ingredient, quantity)
    @ingredients << [ingredient, quantity]
  end

  def list_of_ingredients
    @ingredients.each_with_object([]){|ingredient, array| array << ingredient[0].name}
  end

  def quantity_of_ingredient(input_ingredient)
    @ingredients.find{|ingredient| ingredient[0].name == input_ingredient}.last
  end

  def total_calories
    @ingredients.sum{|ingredient| ingredient[0].calories}
  end
end