module Api
  module V1
    class RolesController < ApplicationController
      before_action :set_role, only: [:show, :update, :destroy]
      after_action :content_range, only: [:index]

      def show
        json_response @role
      end

      def update
        if @role.update(role_params)
          json_response @role
        else
          json_response @role.errors, :unprocessable_entity
        end
      end

      def create
        role = Role.new(role_params)
        if role.validate
          role.save
          json_response role
        else
          json_response role.errors, :unprocessable_entity
        end
      end

      def index
        json_response Role.all
      end

      def destroy
        json_response @role.destroy
      end

      private

      def set_role
        @role = role.find(role_params[:id])
      end

      def role_params
        params.permit(:id, :name)
      end

      def content_range
        headers['Content-Range'] = Role.all.count
        headers['Access-Control-Expose-Headers'] = 'Content-Range'
      end
    end
  end
end