class SongController < ApplicationController

  def create
    Song.new(params[:song].permit(:name, :source_url)).save
    redirect_to(:back)
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to(:back)
  end

end
