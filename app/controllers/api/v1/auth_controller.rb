class Api::V1::AuthController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(email: user_login_params[:email])
    end

end
