class WelcomeController < ApplicationController
  def index
    @users = User.all
  end

  def register
  end

  def create
    user = User.create(user_params)
    if user && user.save
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to '/dashboard'
    else
      flash[:alert] = "Error: Name can't be blank, Email can't be blank and must be valid."
      redirect_to "/register"
    end
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
