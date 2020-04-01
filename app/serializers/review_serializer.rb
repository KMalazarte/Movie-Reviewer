class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :username, :movie_title, :r_comment, :r_score, :movie_poster
end
