class MoviesController < ApplicationController
  skip_before_action :authorized

  def index
    @all = Movie.all
    count = Movie.count.to_s
    response.set_header('X-Total-Count', count)
    render json: @all
  end

  def show
    @movie = Movie.find{|movie| movie[:title] == params[:title]}
    render json: @movie
  end

  def new
  end

  def create
    @movie = Movie.create(movie_params)
    render json: @movie
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
  end

  def delete
    @movie = Movie.find(params[:id])
    @review.destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :avg_score, :movie_img, :user_comment, :user_score, :created_at, :updated_at)
  end
end
