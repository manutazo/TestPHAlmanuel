class UsersController < ApplicationController

  def show
    @albums = current_user.albums
  end

end
