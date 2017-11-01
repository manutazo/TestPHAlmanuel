class ImagesController < ApplicationController
  before_action :set_album

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

end
