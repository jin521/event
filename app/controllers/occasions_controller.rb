class OccasionsController < ApplicationController
  before_action :check_for_user, :except => [:index, :show]

  def index
    @occasions = Occasion.all.order("created_at DESC")

      ###############################
      # EVENTFINDA gem
      auth     = {:username => "gaproject", :password => "p2sb3nk4g3d7"}
      response = HTTParty.get('http://api.eventfinda.com.au/v2/events.json?rows=20', :basic_auth => auth)
       #binding.pry
        response["events"].each do |event|
        occasion = Occasion.find_by :eventfinda_id => event['id']
        # Adding to a var the event id
        #creating an img cariable to get images
        image = event['images']['images'][0]['transforms']['transforms'][-1]['url']
        if occasion.nil?
          Occasion.create :title => event['name'], :description => event['description'], :date_start => event['datetime_start'], :date_end => event['datetime_end'], :latitude => event['point']['lat'], :longitude => event['point']['lng'], :image => image, :eventfinda_id => event['id'], :address => event['address'], :location => event['location_summary']
        end
        # Adding the data to our database and then checking if the id is there not to repeat the events
      end
      @occasions = Occasion.all
  end


  def new
    @occasion = Occasion.new
  end

  def create
    @occasion = Occasion.new(occasion_params) #an object of objects from the data we add in the form when we create a new event
    @occasion.user_id = @current_user.id

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
      redirect_to root_path unless @occasion.user_id == @current_user.id ### AUTHORISATION FOR USERS
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
      if occasion.user_id == @current_user.id || @current_user.admin?
        occasion.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end
  end

  def search #displays a search a search form
  end

  def search_results # displays search results
      @found_occasions_locations = Occasion.location_search(params[:search_location])
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

  # def authorise_user
  #  flash[:notice] = 'Admin acces only' unless current_user.admin?
  #  redirect_to root_path unless current_user.present? && current_user.admin?
#  end
end
