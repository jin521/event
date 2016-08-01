class OccasionsController < ApplicationController
  before_action :check_for_user, :except => [:index, :show]

  def index
    @occasions = Occasion.all.order("created_at DESC")
  end

  def new
    @occasion = Occasion.new
  end

  def create
    @occasion = Occasion.new(occasion_params) #an object of objects from the data we add in the form when we create a new event
    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])     # This is the magic stuff that will let us upload an image to Cloudinary when creating a new occasion.
      @occasion.image = req["url"]
    end
    if @occasion.save
      redirect_to @occasion
    else
      render 'new'
    end
  end

  def show
    @occasion = Occasion.find(params[:id])

  end

  def edit
      @occasion = Occasion.find(params[:id])
  end

  def update
      @occasion = Occasion.find(params[:id])
      if (params[:file]).present?
      req = Cloudinary::Uploader.upload(params[:file])
      @product.image = req["url"]
    end
      if @occasion.update(occasion_params)
        redirect_to @occasion
      else
        render 'edit'
      end
  end

  def destroy
      occasion = Occasion.find(params[:id])
      occasion.destroy
      redirect_to root_path
  end

  def search #displays a search a search form
  end

  def search_results # displays search results
      @found_occasions = Occasion.keyword_search(params[:search_keywords])
  end

  private
  def occasion_params
      params.require(:occasion).permit(:title, :description,:date, :location,:latitude, :longitude, :email, :phone)
  end

  def check_for_user

    # flash[:notice] = 'Please login' unless current_user.present?
    # redirect_to new_user_session_path unless current_user.present?

    # Both above and bottom ways do the same thing

    flash[:notice] = 'Please login' unless user_signed_in?
    redirect_to new_user_session_path unless user_signed_in?
  end

  def check_for_admin
    flash[:notice] = 'Admin acces only' unless @current_user.admin?
    redirect_to root_path unless @current_user.admin?
  end
end
