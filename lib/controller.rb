require_relative 'view'

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
    recipe = Recipe.new(name, description)
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
end
