class LikeController < ApplicationController

  def new
    like = Like.where(:user => current_user, :song => Song.find(params[:song_id])).first
    unless like.nil?
      like.destroy
    end
    like = Like.new
    like.user = current_user
    like.value = params[:value]
    like.song = Song.find(params[:song_id])
    like.save
    redirect_to (:back)
  end

end
