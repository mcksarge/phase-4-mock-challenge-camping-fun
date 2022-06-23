class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render json: { errors: [signup.errors.full_messages] }, status: :unprocessable_entity
        end
    end

    private

    def render_not_found_response
        render json: { error: "Signup not found" }, status: :not_found
    end

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
    

end
