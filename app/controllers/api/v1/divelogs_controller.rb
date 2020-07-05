class Api::V1::DivelogsController < ApplicationController

    def index
        if logged_in?
          @secrets = current_user.secrets
          render json: @secrets, status: :ok
        else
          render json: { error: 'not logged in', status: :unauthorized }
        end
    end
    
end
