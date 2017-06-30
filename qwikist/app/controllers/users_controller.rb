class UsersController < ApplicationController

before_filter :authenticate_user!
after_action :verify_authorized

  def index
    @users = User.all.order('id ASC')
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
  
  def test
    @user = current_user
    if current_user.role == "admin"
      @test = "1"
    elsif current_user.role == "client"
      @test = "2"
    elsif current_user.role == "trainer"
      @test = "3"
    elsif current_user.role == "gym"
      @test = "4"
    else
      @test = "error"
    end
    authorize User
  end
  
  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User Deleted"
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update_attributes(secure_params)
      redirect_to users_path, :success => "User updated"
    else
      redirect_to users_path, :alert => "Unable to update"
    end
  end

  private
    def secure_params
      params.require(:user).permit(:role)
    end
end
