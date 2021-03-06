module Api
  module V1
    class ParticipationsController < ApplicationController
      before_action :set_participation, only: [:show, :update, :destroy]
      after_action :content_range, only: [:index]

      def show
        json_response @participation
      end

      def update
        if @participation.update(participation_params)
          json_response @participation
        else
          json_response @participation.errors, :unprocessable_entity
        end
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
        json_response Participation.all
      end

      def destroy
        json_response @participation.destroy
      end

      private

      def participation_params
        params.permit(:id, :person_id, :role_id, :movie_id)
      end

      def set_participation
        @participation = Participation.find(participation_params[:id])
      end

      def content_range
        headers['Content-Range'] = Participation.all.count
        headers['Access-Control-Expose-Headers'] = 'Content-Range'
      end
    end
  end
end