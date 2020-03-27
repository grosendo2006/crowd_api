module Api
  module V1
    module People
      class MoviesController < ApplicationController
        after_action :content_range, only: [:index]

        def index
          render json: Api::V1::Movies::Index.new(movie_params).call
        end

        private

        def movie_params
          params.permit(:id, :person_id)
        end

        def content_range
          headers['Content-Range'] = Movie.all.count
          headers['Access-Control-Expose-Headers'] = 'Content-Range'
        end
      end
    end
  end
end