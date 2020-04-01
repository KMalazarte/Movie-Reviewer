class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :avg_score, :movie_img, :slug
end
