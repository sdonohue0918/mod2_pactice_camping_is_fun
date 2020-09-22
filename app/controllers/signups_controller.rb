class SignupsController < ApplicationController
    def new
        @signup = Signup.new
    end

    def create
        @signup = Signup.create(sign_params)
        if @signup.valid?
            redirect_to camper_path(@signup.camper)
        else
          flash[:signup_errors] = @signup.errors.full_messages  
        end
    
    end

    private

    def sign_params
    
        params.require(:signup).permit(:camper_id, :activity_id, :time)
    end
end