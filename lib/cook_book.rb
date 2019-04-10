require './lib/recipe'
require './lib/ingredient'

class CookBook
  attr_reader :summary

  def initialize
    @summary = []
  end

  def add_recipe(recipe)
    # record ={name: recipe.last.name}
    # binding.pry
    @summary << recipe
  end
end