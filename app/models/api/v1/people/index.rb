# frozen_string_literal: true

module Api
  module V1
    module People
      # Api::V1::People::Index
      class Index
        def initialize(people_params)
          @people_params = people_params
          @people_data   = []
        end

        def call
          movie_query.people.each do |people|
            @people_data << {
              name: "#{people.first_name} #{people.last_name}",
              roles: people.roles.map(&:name)
            }
          end
          @people_data
        end

        private

        def movie_query
          @movie_query ||=
            Movie.eager_load(:people)
                 .find(@people_params[:movie_id])
        end
      end
    end
  end
end
