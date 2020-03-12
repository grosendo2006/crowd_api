module Api
  module V1
    class RolsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def show
        render json: Rol.find(people_params[:id])
      end

      def update
        
      end

      def create
        Rol.create(rol_params)
      end

      def index
        
      end

      private

      def rol_params
        params.permit(:id, :name)
      end
    end
  end
end