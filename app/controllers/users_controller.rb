class UsersController < ApplicationController
  def index
    @users = User.includes(:todos).order(:name)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to todos_path, notice: "Account created successfully. Welcome!"
    else
      flash.now[:alert] = "Please fix the highlighted issues to continue."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
