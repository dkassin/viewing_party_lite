class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(session[:user_id])
    @parties = @user.parties
  end

  def new
  end

  def discover
    @user = User.find(session[:user_id])
  end

  def login_form
  end

  def login_user
     user = User.find_by(email: params[:email])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       flash[:success] = "Welcome, #{user.name}!"
       redirect_to "/dashboard"
     else
       flash[:error] = "Sorry, your credentials are bad."
       render :login_form
     end
  end

  def destroy
    session.destroy
  end
end
