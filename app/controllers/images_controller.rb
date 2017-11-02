class ImagesController < ApplicationController
  before_action :set_album
  before_action :owner, only: [:add_more_images]

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @album.save
    redirect_to albums_path @album
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def add_more_images(new_images)
    images = @album.images # copia las imagenes antiguas
    images += new_images # concatena las imagenes antiguas con las nuevas
    @album.images = images
  end

  def images_params
    params.require(:album).permit({images: []})
  end

  def owner
  unless current_user == @album.user
    flash[:alert] = "No tiene acceso"
    redirect_to root_path
  end
end

end
