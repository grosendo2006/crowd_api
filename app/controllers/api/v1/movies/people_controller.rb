module Api
  module V1
    module Movies
      class PeopleController < ApplicationController
        skip_before_action :verify_authenticity_token

        def index
          people_data = []
          movie = Movie.eager_load(:people).find(people_params[:movie_id])
          movie.people.each do |people|
            people_data << {
              name: "#{people.first_name} #{people.last_name}",
              rols: people.rols.map(&:name)
            }
          end
          render json: people_data
        end

        private

        def people_params
          params.permit(:id, :movie_id)
        end
      end
    end
  end
end