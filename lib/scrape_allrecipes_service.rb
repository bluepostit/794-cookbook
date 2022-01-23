require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://www.allrecipes.com/search/results/?search=#{@keyword}"
    doc = Nokogiri::HTML(URI.open(url).read, nil, "utf-8")

    doc.search('.card__detailsContainer').take(5).map do |result|
      name = result.search('.card__title').text.strip
      description = result.search('.card__summary').text.strip
      rating = result.search('.rating-star.active').count

      link = result.search('.card__titleLink').attribute('href').value
      link_doc = Nokogiri::HTML(URI.open(link).read, nil, "utf-8")
      prep_time = link_doc.search('.recipe-meta-item .recipe-meta-item-body').first.text
      Recipe.new(
        name: name,
        description: description,
        rating: rating,
        prep_time: prep_time
      )
    end
  end
end
