class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    # @user = User.new(user_params)
    render :new
  end

  def show
    @user = User.find(params[:id])
    render
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
