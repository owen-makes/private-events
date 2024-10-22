class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]
  # before_action :set_user
  def show
          # For /users/:id
          @user = User.find(params[:id]) if params[:id]
          # For /users/profile
          @user ||= current_user
  end

  def edit
    @user = current_user
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
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :email) # Add other permitted attributes
  end
end
