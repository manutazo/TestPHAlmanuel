class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    if params[:id].to_i == current_user.id
    @user = User.find(params[:id])
    @albums = @user.albums
    else
      redirect_to profile_path(current_user.id)
  end
end

end
