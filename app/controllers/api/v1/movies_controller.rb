module Api
  module V1
    class MoviesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def show
        render json: Movie.find(movie_params[:id])
      end

      def update
        
      end

      def create
        Movie.create(movie_params)
      end

      def index
        render json: Movie.all.to_json(methods: :release_year)
      end

      private

      def movie_params
        params.permit(:id, :title, :release_year)
      end
    end
  end
end