class AlbumsController < ApplicationController
  def index
    @albums = Album.order("artist, year, name")
  end

  def new
    @album = Album.new(params[:album])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(params[:album])

    if @album.save
      puts "Album Save"
      redirect_to albums_path, :notice => "Album created successfuly"
    else
      set_flash_error_for @album, "The album cannot be saved"
      render "new"
    end
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      redirect_to albums_path, :notice => "Album updated successfuly"
    else
      set_flash_error_for @album, "The album cannot be updated"
      render "edit"
    end
  end

  def destroy
  end

end
