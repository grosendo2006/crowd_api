module Api
  module V1
    class PeopleController < ApplicationController
      before_action :set_person, only: [:show, :update, :destroy]
      after_action :content_range, only: [:index]

      def show
        json_response @person
      end

      def update
        if @person.update(people_params)
          json_response @person
        else
          json_response @person.errors, :unprocessable_entity
        end
      end

      def create
        person = Person.new(people_params)
        if person.validate
          person.save
          json_response person
        else
          json_response person.errors, :unprocessable_entity
        end
      end

      def index
        json_response Person.all
      end

      def destroy
        json_response @person.destroy
      end

      private

      def set_person
        @person = Person.find(people_params[:id])
      end

      def people_params
        params.permit(:id, :last_name, :first_name, :aliases)
      end

      def content_range
        headers['Content-Range'] = Person.all.count
        headers['Access-Control-Expose-Headers'] = 'Content-Range'
      end
    end
  end
end