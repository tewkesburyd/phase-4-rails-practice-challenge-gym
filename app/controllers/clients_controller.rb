class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message

    def index
        render json: Client.all
    end

    def show
        client = Client.find(params[:id])
        render json: client, serializer: ClientMembershipSerializer 
    end

    private

    def render_not_found_message
        render json: {error: 'Client not found'}, status: :not_found
    end
end
