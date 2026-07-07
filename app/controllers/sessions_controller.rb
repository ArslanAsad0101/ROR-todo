class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      session[:user_id] = user.id
      redirect_to todos_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid email"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out"
  end
end
