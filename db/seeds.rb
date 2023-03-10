# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Movie.destroy_all

require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
base_url = "https://image.tmdb.org/t/p/w500"
uri = URI.open(url).read
json = JSON.parse(uri)
 #retourne tableau de JSON
json["results"].each do |element|
  title = element["original_title"]
  overview = element["overview"]
  poster_url = base_url + element["poster_path"]
  rating = element["vote_average"]
  # puts element.overview
  Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

List.create(name: 'Action')
List.create(name: 'Aventure')
List.create(name: 'Comédie')
List.create(name: 'Drame')
List.create(name: 'Horreur')
List.create(name: 'Amour')
List.create(name: 'Policier')
List.create(name: 'Wester')
