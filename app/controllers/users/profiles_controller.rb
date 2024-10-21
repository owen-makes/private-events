class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]
  before_action :set_user
  def show
  end

  def edit
    redirect_to users_profile_path unless @user == current_user
  end

  def update
    if @user == current_user && @user.update(user_params)
      redirect_to users_profile_path, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = params[:id] ? User.find(params[:id]) : current_user
  end

  def user_params
    params.require(:user).permit(:full_name, :email) # Add other permitted attributes
  end
end
