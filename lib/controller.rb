require_relative 'view'
require_relative 'scrape_allrecipes_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # get all recipes from the cookbook
    # display them to the user using the view
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    # get name & description for new recipe from user (view)
    # create a new Recipe instance
    # add it to the cookbook
    name = @view.ask_user_for('name')
    description = @view.ask_user_for('description')
    rating = @view.ask_user_for('rating')
    prep_time = @view.ask_user_for('preparation time')
    recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # display all recipes to the user (view)
    # ask user to choose a recipe to delete (index, using view)
    # tell cookbook to delete recipe at this index
    list
    index = @view.ask_user_for_index
    @cookbook.remove_recipe(index)
  end

  def import
    # ask user for keyword
    # download search results with keyword
    # prepare array of the results (first 5) as Recipe instances
    # display array to user
    # ask user for the index
    # get recipe at the index position in the results array
    # add it to cookbook
    keyword = @view.ask_user_for_search_keyword
    results = ScrapeAllrecipesService.new(keyword).call

    @view.display(results)
    index = @view.ask_user_for_index
    recipe = results[index]
    @cookbook.add_recipe(recipe)
  end
end
