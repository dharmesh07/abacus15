class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @locations = Location.all
    respond_with(@locations)
  end

  def show
    respond_with(@location)
  end

  def new
    @location = Location.new
    @location.latlong=params[:latlong]
    @location.pos_name=params[:desc]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def create
  if user_signed_in?
    @location = Location.new(location_params)
    @location.user_id=current_user.id
    @location.email=current_user.email
    if @location.save
      redirect_to root_path
    else
    respond_with(@location)
    end
  else
    redirect_to new_user_session_path
  end
  end

  def update
    @location.update(location_params)
    respond_with(@location)
  end

  def destroy
    @location.destroy
    respond_with(@location)
  end
  def save_loc
    @location=Location.new(location_params)
    if (@location.save)
      redirect_to root_path
    else
      respond_with(@location)
    end
  end
  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:user_id, :latlong, :pos_name, :email)
    end
end
