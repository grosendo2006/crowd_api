# frozen_string_literal: true

module Api
  module V1
    module Movies
      # Api::V1::Movies::Index
      class Index
        def initialize(movie_params)
          @movie_params = movie_params
          @movies_data  = []
        end

        def call
          person_query_2.movies.each do |movie|
            @movies_data << {
              movie: movie.title,
              rols: person_query.participations_in(movie)
            }
          end
          @movies_data
        end

        private

        def person_query
          @person_query ||=
            Person.eager_load(:movies)
                  .includes(participations: [:rol])
                  .find(@movie_params[:person_id])
        end
      end
    end
  end
end
