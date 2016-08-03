class UsersController < ApplicationController
  def index

  end

  def new
  end

  def edit
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name,:password,:email,:admin)
  end
end
