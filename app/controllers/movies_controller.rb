class MoviesController < ApplicationController
  skip_before_action :authorized

  def index
    @all = Movie.all
    render json: @all
  end

  def show
    @movie = Movie.find{|movie| movie[:title] == params[:title]}
    render json: @movie
  end

  def new
  end

  def create
  end

  def update
  end

  def delete
  end
end
