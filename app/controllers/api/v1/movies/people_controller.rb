module Api
  module V1
    module Movies
      class PeopleController < ApplicationController
        after_action :content_range, only: [:index]

        def index
          render json: Api::V1::People::Index.new(people_params).call
        end

        private

        def people_params
          params.permit(:id, :movie_id)
        end

        def content_range
          headers['Content-Range'] = Person.all.count
          headers['Access-Control-Expose-Headers'] = 'Content-Range'
        end
      end
    end
  end
end