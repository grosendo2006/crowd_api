module Api
  module V1
    class PeopleController < ApplicationController
      skip_before_action :verify_authenticity_token

      def show
        render json: Person.find(people_params[:id])
      end

      def update
        
      end

      def create
        Person.create(people_params)
      end

      def index
        
      end

      private

      def people_params
        params.permit(:id, :last_name, :first_name, :aliases)
      end
    end
  end
end