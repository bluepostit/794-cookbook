class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_user_for(thing)
    puts "Please enter the recipe #{thing}"
    print '> '
    gets.chomp
  end

  def ask_user_for_index
    ask_user_for('number').to_i - 1
  end
end
