class Api::V1::UsersController < ApplicationController

    # unlock this action so that users can sign up
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.create(user_params)
        if @user.valid?
          # create a token for user
          @token = encode_token(user_id: @user.id)
          # issue token to user when they register
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
