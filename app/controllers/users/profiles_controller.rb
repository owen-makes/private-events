class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_profile_path, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email) # Add other permitted attributes
  end
end
