class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :add_video

  def show
    @user = User.friendly.find(params[:id])
    @current_user = current_user
    authorize @user
  end

  def add_video
    param = params[:user]
    @current_user.video = param[:video]
    render nothing: true, status: 200
  end

  def vote_up
    @user = User.friendly.find(params[:id])
    current_user.vote_for(@user)
  end

  def vote_down
    @user = User.friendly.find(params[:id])
    current_user.unvote_for(@user)
  end
end