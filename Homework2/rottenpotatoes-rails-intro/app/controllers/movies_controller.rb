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
    @movies = Movie.all
    redirect = false
    
    logger.debug(session.inspect)
    
    if(params[:sort_by])
      @sort_movies = params[:sort_by]
      session[:sort_by] = params[:sort_by]
    elsif session[:sort_by]
      @sort_movies = session[:sort_by]
      redirect = true
    else
      @sort_movies = nil
    end
    
    if params[:commit] == "Refresh" and params[:ratings].nil?
      @movie_ratings = nil
      session[:ratings] = nil
    elsif params[:ratings]
      @movie_ratings = params[:ratings]
      session[:ratings] = params[:ratings]
    elsif session[:ratings]
      @movie_ratings = session[:ratings]
      redirect = true
    else
      @movie_ratings = nil
    end
    
    if redirect
      flash.keep
      redirect_to movies_path :sort_by=>@sort_movies, :ratings=>@movie_ratings
    end
    
    if @movie_ratings and @sort_movies
      @movies = Movie.where(:rating => @movie_ratings.keys).order(@sort_movies)
    elsif @movie_ratings
      @movies = Movie.where(:rating => @movie_ratings.keys)
    elsif @sort_movies
      @movies = Movie.order(@sort_movies)
    else
      @movie = Movie.all
    end
    if !@movie_ratings
      @movie_ratings = Hash.new
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
