class PagesController < ApplicationController
  def home
    @occasions = Occasion.all
  end
end
