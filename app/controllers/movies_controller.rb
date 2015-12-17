class MoviesController < ApplicationController
    def index
        @movies = Movie.released
    end

    def show
        @movie = Movie.find(params[:id])    
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_path
    end

    def update
        @movie = Movie.find(params[:id])
        movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
        @movie.update(movie_params)
        redirect_to @movie
    end

    def new
        @movie = Movie.new
    end

    def create
        movie_params = params.require(:movie).
            permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
        @movie = Movie.new(movie_params)
        @movie.save
        redirect_to @movie
    end
end