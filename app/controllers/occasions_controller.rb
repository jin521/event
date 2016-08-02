class OccasionsController < ApplicationController
  def index
    @occasions = Occasion.all.order("created_at DESC")

      ###############################
      # EVENTFINDA gem
      auth     = {:username => "gaproject", :password => "p2sb3nk4g3d7"}
      response = HTTParty.get('http://api.eventfinda.com.au/v2/events.json?rows=20', :basic_auth => auth)
        # binding.pry
        response["events"].each do |event|
        occasion = Occasion.find_by :eventfinda_id => event['id']
        # Adding to a var the event id
        #creating an img cariable to get images
        image = event['images']['images'][0]['transforms']['transforms'][-1]['url']
        if occasion.nil?

          Occasion.create :title => event['name'], :description => event['description'], :date_start => event['datetime_start'], :date_end => event['datetime_end'], :latitude => event['point']['lat'], :longitude => event['point']['lng'], :image => image, :eventfinda_id => event['id'], :address => event['address'], :location => event['location_summary']
          #fetching  API data and saving to database(.create), renaming attribute names of API event data

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

  def search #displays search forms
  end

  def search_results # displays search results
    # raise 'hell'
    if params.has_key?("search_location")  #"search_location" is the id of this search from, has.key? means is this search form is filled out
      # raise 'hell'
      @found_occasions = Occasion.location_search(params[:search_location])  # we make location_search a model level method
      @search_term = params[:search_location]  #create this varible to store the name to display for search, check search_results.html.erb

    elsif params.has_key?("search_keywords")
      @found_occasions = Occasion.keyword_search(params[:search_keywords])
      @search_term = params[:search_keywords]

    elsif params.has_key?(:search_date_from) || params.has_key?(:search_date_to)
      date_start = Date.strptime(params[:search_date_from], "%m/%d/%Y") # converting the date formate form jquery date picker into the formate Rails recognize
      date_end = Date.strptime(params[:search_date_to], "%m/%d/%Y")
      @found_occasions = Occasion.date_search(date_start, date_end)  # we make date_search a model level method
      @search_term = params[:search_date_from] + " - " + params[:search_date_to]
    end
  end



  private

  def occasion_params
      params.require(:occasion).permit(:title, :description,:date, :location,:latitude, :longitude, :email, :phone)
  end


end
