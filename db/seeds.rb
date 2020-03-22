require 'rest-client'
require 'byebug'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create :username => "Kevin", :password_digest => "Kevin"

def get_popular_movies()
  api = RestClient.get("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=ENV['EXAMPLE_API_KEY']")
  movie_obj = JSON.parse(api)

  # byebug
    data = movie_obj["results"]

    data.map{|movie| Movie.create(title: movie["title"], description: movie["overview"], avg_score: movie["vote_average"], movie_img: movie["poster_path"], user_comment: [])}
end

get_popular_movies
