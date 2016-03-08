class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    authorize @user
    #unless @user == current_user
    #  redirect_to root_path
    #end
  end
end