module Api
  module V1
    class ParticipationsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def show
        render json: Participation.find(people_params[:id])
      end

      def update
        
      end

      def create
        participation = Participation.new(participation_params)
        if participation.validate
          participation.save
          json_response participation
        else
          json_response participation.errors, :unprocessable_entity
        end
      end

      def index
        
      end

      private

      def participation_params
        params.permit(:id, :person_id, :role_id, :movie_id)
      end
    end
  end
end