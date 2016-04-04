class VideosController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    current_user.videos.create(name: params[:video])
    redirect_to user_path(current_user)
    #render nothing: true, status: 200
  end
end