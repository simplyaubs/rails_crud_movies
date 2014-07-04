class MoviesController < ApplicationController

  def index
    @movie = Movie.new
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save

      redirect_to movies_path
    else
      render :index
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :rating)
  end

end