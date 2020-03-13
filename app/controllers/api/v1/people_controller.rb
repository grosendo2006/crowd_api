module Api
  module V1
    class PeopleController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_person, only: [:show, :update, :destroy]

      def show
        json_response @person
      end

      def update
        @person.update(people_params)
      end

      def create
        Person.create(people_params)
      end

      def index
        json_response People.all
      end

      def destroy
        @movie.destroy
        head :no_content
      end

      private

      def set_person
        @person = Person.find(people_params[:id])
      end

      def people_params
        params.permit(:id, :last_name, :first_name, :aliases)
      end
    end
  end
end