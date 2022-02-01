class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @parties = @user.parties
  end

  def new
  end

  def create
    user = User.create(user_params)
    redirect_to user_path(user.id)
  end

private
  def user_params
    params.permit(:name, :email)
  end
end
