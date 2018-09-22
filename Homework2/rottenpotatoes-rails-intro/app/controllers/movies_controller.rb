class MoviesController < ApplicationController
# Code for this file based on these videos: https://www.youtube.com/watch?v=xyi4YnX7LUQ
#https://www.youtube.com/watch?v=OUCQ1VJ2Lzg
#https://www.youtube.com/watch?v=QeuYemlTu8I

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    @column_sort_by = params[:sort_by]
    @set_ratings = params[:ratings]
    
    if @set_ratings and @column_sort_by
      @movies = Movie.where(:rating => params[:ratings].keys).order(params[:sort_by])
    elsif @set_ratings
      @movies = Movie.where(:rating => params[:ratings].keys)
    elsif @column_sort_by
      @movies = Movie.order(params[:sort_by])
    else
      @movie = Movie.all
    end
    if !@set_ratings
      @set_ratings = Hash.new
    end
    @movies = Movie.all
    if params[:ratings]
      @movies = Movie.where(:rating => params[:ratings].keys).order(params[:sort_by])
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
