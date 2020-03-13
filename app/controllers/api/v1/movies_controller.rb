module Api
  module V1
    class MoviesController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_movie, only: [:show, :update, :destroy]

      def show
        json_response @movie
      end

      def update
        @movie.update(movie_params)
      end

      def create
        Movie.create(movie_params)
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
        @movie = Movie.find(movie_params[:id])
      end

      def movie_params
        params.permit(:id, :title, :release_year)
      end
    end
  end
end