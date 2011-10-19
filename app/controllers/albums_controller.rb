class AlbumsController < ApplicationController
  def index
    @albums = Album.order("artist, year, name")
  end

  def new
    @album = Album.new(params[:album])
  end

  def edit
  end

  def create
    @album = Album.new(params[:album])

    if @album.save
      puts "Album Save"
      redirect_to albums_path, :notice => "Album created successfuly"
    else
      flash[:error] = @album.errors.full_messages
      flash[:title] = "The album cannot be saved"
      render "new"
    end
  end

  def update
  end

  def destroy
  end

end
