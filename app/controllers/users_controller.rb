class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :owner, only: [:show]


  def show
    @user = User.find(params[:id])
    @albums = @user.albums
  end

  private

  def owner
    unless current_user.id == params[:id].to_i
      flash[:alert] = "No tiene acceso"
      redirect_to root_path
    end
  end


end
