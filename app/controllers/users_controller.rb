class UsersController < ApplicationController
  def index

  end

  def new
  end

  def edit
  end

  def show
  end

  def list_rsvps
      @rsvps = Rsvp.where(user_id: current_user.id )
  end

  private
  def user_params
    params.require(:user).permit(:name,:password,:email,:admin)
  end
end
