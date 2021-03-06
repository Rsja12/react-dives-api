class Api::V1::DivelogsController < ApplicationController

  def index
    if logged_in?
      @divelogs = current_user.divelogs 
        render json: @divelogs, status: :ok
    else
      render json: { error: 'you are not authenticated for this request', status: :unauthorized }
    end
  end

  def create
    if logged_in?
      @divelog = current_user.divelogs.create(divelog_params)
      render json: @divelog    
    else 
      render json: { error: 'You must be signed in to create a dive' }      
    end
  end

  def show
    if logged_in?
      @divelog = current_user.divelogs.find_by(id: params[:id])
      render json: @divelog
    else
      render json: { error: 'you are not authenticated for this request', status: :unauthorized }
    end
  end

  def update
    if logged_in?
      @divelog = current_user.divelogs.find_by(id: params[:id])
      @divelog.update(divelog_params)
      render json: @divelog
    else
      render json: { error: 'you are not authenticated for this request', status: :unauthorized }
    end
  end

  def destroy
    if logged_in?
      @divelog = current_user.divelogs.find_by(id: params[:id])
      @divelog.destroy
    else
      render json: { error: 'you are not authenticated for this request', status: :unauthorized }
    end
  end

  private

  def divelog_params
    params.require(:divelog).permit(:location, :divesite, :max_depth, :bottom_time, :visibility, :water_temp, :weight, :notes)
  end
    
end
