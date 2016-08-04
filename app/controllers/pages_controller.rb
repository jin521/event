class PagesController < ApplicationController
  def home
    @occasions = Occasion.all.order("created_at DESC")
  end
end
