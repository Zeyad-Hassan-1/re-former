class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: "User was successfully created."
    else
      render :new
    end
  end

  def search
    @user = User.new
  end

  def find_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      redirect_to edit_user_path(@user)
    else
      flash.now[:alert] = "User not found."
      render :search
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: "User was successfully updated."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
