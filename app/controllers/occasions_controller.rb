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
          Occasion.create :title => event['name'], :description => event['description'], :date_start => event['datetime_start'], :date_end => event['datetime_end'], :latitude => event['point']['lat'], :longitude => event['point']['lng'], :image => image, :eventfinda_id => event['id']
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
