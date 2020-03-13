module Api
  module V1
    class MoviesController < ApplicationController
      skip_before_action :verify_authenticity_token
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
        if Movie.create!(movie_params)
          json_response @movie
        else
          json_response @movie.errors, :unprocessable_entity
        end
      end

      def destroy
        @movie.destroy
        head :no_content
      end

      def index
        json_response Movie.all.to_json(methods: :release_year)
      end

      private

      def set_movie
        @movie.decorate = Movie.find(movie_params[:id])
      end

      def movie_params
        params.permit(:id, :title, :release_year)
      end
    end
  end
end