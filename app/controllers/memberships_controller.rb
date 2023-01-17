class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invlaid_input_response

    def index
        render json: Membership.all
    end

    def create
        membership = Membership.create!(membership_params)
        render json: membership
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def render_invlaid_input_response(exception)
        # pry here
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
