class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to todos_path, notice: "Logged in successfully"
    else
      @user = User.new
      @error_message = "Invalid email or password. Try again or create an account."
      flash.now[:alert] = @error_message
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out"
  end
end
