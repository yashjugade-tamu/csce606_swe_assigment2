class MoviesController < ApplicationController
  SORT_COLUMNS = %w[title rating release_date].freeze
  SORT_DIRECTIONS = %w[asc desc].freeze

  before_action :remember_sort_order
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @movies = Movie.order(Arel.sql("#{@sort_column} #{@sort_direction}"))
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "Movie was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path, notice: "Movie was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, notice: "Movie was successfully deleted.", status: :see_other
  end

  private

  def remember_sort_order
    if SORT_COLUMNS.include?(params[:sort]) && SORT_DIRECTIONS.include?(params[:direction])
      session[:movie_sort] = { "column" => params[:sort], "direction" => params[:direction] }
    elsif params[:sort].present? && !SORT_COLUMNS.include?(params[:sort])
      session[:movie_sort] = { "column" => "title", "direction" => "asc" }
    end

    preferences = session[:movie_sort] || {}
    @sort_column = SORT_COLUMNS.include?(preferences["column"]) ? preferences["column"] : "title"
    @sort_direction = SORT_DIRECTIONS.include?(preferences["direction"]) ? preferences["direction"] : "asc"
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
