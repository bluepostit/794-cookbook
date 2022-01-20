require_relative 'cookbook'
require_relative 'recipe'

cookbook = Cookbook.new('lib/recipes.csv')

cookbook.all.each do |recipe|
  puts "#{recipe.name} - #{recipe.description}"
end

hamburger = Recipe.new('hamburger', 'beefy goodness')
cookbook.add_recipe(hamburger)

puts '....................'

cookbook.all.each do |recipe|
  puts "#{recipe.name} - #{recipe.description}"
end

puts '....................'
cookbook.remove_recipe(0)

cookbook.all.each do |recipe|
  puts "#{recipe.name} - #{recipe.description}"
end
