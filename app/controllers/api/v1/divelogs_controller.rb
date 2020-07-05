class Api::V1::DivelogsController < ApplicationController

    def index
        if logged_in?
          @divelogs = current_user.divelogs
          render json: @divelogs, status: :ok
        else
          render json: { error: 'not logged in', status: :unauthorized }
        end
    end
    
end
