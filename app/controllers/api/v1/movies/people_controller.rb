module Api
  module V1
    module Movies
      class PeopleController < ApplicationController

        def index
          render json: Api::V1::People::Index.new(people_params).call
        end

        private

        def people_params
          params.permit(:id, :movie_id)
        end
      end
    end
  end
end