require 'csv'
require_relative 'recipe'

class Cookbook
  # State
  # - recipes
  # - CSV file path
  # Behavior
  # - add a recipe
  # - remove a recipe by its index
  # - get all recipes

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row) do |row|
      recipe = Recipe.new(
        name: row['name'],
        description: row['description'],
        rating: row['rating'],
        prep_time: row['prep_time']
      )
      @recipes << recipe
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      # write the header row first!
      csv << %w[name description rating prep_time]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time]
      end
    end
  end
end
