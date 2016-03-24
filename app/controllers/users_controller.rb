class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :add_video

  def show
    @user = User.friendly.find(params[:id])
    @current_user = current_user
    authorize @user
  end

  def add_video
    current_user.update_attribute(:video, params[:user][:video])
  end

  def vote_up
    @user = User.friendly.find(params[:id])
    current_user.vote_for(@user)
  end

  def vote_down
    @user = User.friendly.find(params[:id])
    current_user.unvote_for(@user)
  end

  def search
    @search = Sunspot.search( User ) do
      fulltext params[:name]
    end

    @user = @search.results.first
  end
end