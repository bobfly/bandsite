class PublicController < ApplicationController
  def index
  	@events = Event.where("public = ? and event_date >= ?", true, Time.now).order("event_date asc").paginate(:page => params[:page], :per_page => 3)
  end

  def about
  	
  end
end
