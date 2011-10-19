class ArtistsController < ApplicationController
  def create
    @artist = Artist.new(params[:artist])

    if @artist.save
      flash[:notice] = "Artist created successfuly"
    else
      flash[:error] = "Artist cannot be saved"
    end

    redirect_to new_album_path
  end

end
