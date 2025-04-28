module Api
  module V1
    class CustomersController < ApplicationController
      skip_before_action :verify_authenticity_token

      def invite
        file = params[:file]
        if file.blank?
          return render json: { error: "File is required" }, status: :unprocessable_entity
        end

        unless File.extname(file.original_filename) == ".txt"
          return render json: { error: "Only .txt files are allowed" }, status: :unprocessable_entity
        end

        customer_invite_service = Customers::InviteService.new(params[:file])
        result = customer_invite_service.call
        render json: result, status: :ok
      rescue Customers::InviteService::InvalidFileError => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    end
  end
end