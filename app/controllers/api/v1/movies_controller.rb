module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: [:show, :update, :destroy]

      def show
        json_response @movie
      end

      def update
        if @movie.update(movie_params)
          json_response @movie
        else
          json_response @movie.errors, :unprocessable_entity
        end
      end

      def create
        movie = Movie.new(movie_params)
        if movie.validate
          movie.save
          json_response movie
        else
          json_response movie.errors, :unprocessable_entity
        end
      end

      def destroy
        @movie.destroy
        head :no_content
      end

      def index
        @movies = MovieDecorator.decorate_collection(Movie.all)
        json_response @movies
      end

      private

      def set_movie
        @movie = Movie.find(movie_params[:id]).decorate
      end

      def movie_params
        params.permit(:id, :title, :release_year)
      end
    end
  end
end