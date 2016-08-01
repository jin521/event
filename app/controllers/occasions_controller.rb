class OccasionsController < ApplicationController



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



  private

  def occasion_params
      params.require(:occasion).permit(:title, :description,:date, :location,:latitude, :longitude, :email, :phone)
  end
end
