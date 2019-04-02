class UsersController < ApplicationController

  def index
    @users = User.all

    if @users
      render json: @users
    else
      render plain: "We should never see this"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      render json: @user
    else
      render plain: "No user found"
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user
      @user.update(user_params)
      render json: @user
    else
      render plain: "User not found"
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user
      render plain: @user.destroy
    else
      render plain: "User not found"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
