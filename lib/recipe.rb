class Recipe
  # State
  # - name
  # - description
  # Behavior
  # - readers

  attr_reader :name, :description, :rating, :prep_time

  # {
  #   name: 'strawberry cake',
  #   description: '....',
  #   rating: 4
  # }

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating]
    @prep_time = attributes[:prep_time]
  end
end
