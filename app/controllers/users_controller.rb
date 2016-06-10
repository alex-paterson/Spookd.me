class UsersController < ApplicationController

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if current_user == nil
      flash[:danger] = "Permission denied."
      redirect_to root_url
    end
    if @user != current_user && current_user.admin == false
      flash[:danger] = "Permission denied."
      redirect_to root_url
    end
    @user.destroy
    flash[:success] = "User was successfully destroyed."
    redirect_to root_url
  end
end
