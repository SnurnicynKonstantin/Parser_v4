class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.friendly.find(params[:id])
    @current_user = current_user
    authorize @user
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