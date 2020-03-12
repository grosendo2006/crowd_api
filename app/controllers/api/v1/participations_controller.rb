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
        Participation.create(participation_params)
      end

      def index
        
      end

      private

      def participation_params
        params.permit(:id, :person_id, :rol_id, :movie_id)
      end
    end
  end
end