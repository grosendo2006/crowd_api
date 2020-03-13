module Api
  module V1
    module People
      class MoviesController < ApplicationController
        skip_before_action :verify_authenticity_token

        def index
          render json: Api::V1::Movies::Index.new(movie_params).call
        end

        private

        def movie_params
          params.permit(:id, :person_id)
        end
      end
    end
  end
end