module Api
  module V1
    module People
      class MoviesController < ApplicationController
        skip_before_action :verify_authenticity_token

        def index
          movies_data = []
          person = Person.eager_load(:movies).find(movie_params[:person_id])
          person.movies.each do |movie|
            movies_data << {
              movie: movie.title,
              rols: movie.participations.map(&:rol).map(&:name)
            }
          end
          render json: movies_data
        end

        private

        def movie_params
          params.permit(:id, :person_id)
        end
      end
    end
  end
end