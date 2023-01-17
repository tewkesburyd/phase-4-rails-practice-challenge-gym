class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message

    def index
        render json: Gym.all
    end

    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        render json: gym, state: :success
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def render_not_found_message
        render json: {error: "Gym not found"}, status: :not_found
    end
end
