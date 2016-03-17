class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(name: params[:id])
    @current_user = current_user
    authorize @user
  end

  def vote_up
    current_user.vote_for(@user = User.find(params[:id]))
  end

  def vote_down
    current_user.unvote_for(@user = User.find(params[:id]))
  end
end