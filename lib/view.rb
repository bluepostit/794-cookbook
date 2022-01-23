class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description} (#{recipe.rating}) [#{recipe.prep_time}]"
    end
  end

  def ask_user_for(thing)
    puts "Please enter the recipe #{thing}"
    print '> '
    gets.chomp
  end

  def ask_user_for_search_keyword
    puts "Please enter the keyword to search for"
    print '> '
    gets.chomp
  end

  def ask_user_for_index
    ask_user_for('number').to_i - 1
  end
end
