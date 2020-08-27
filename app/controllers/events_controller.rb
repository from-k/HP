class EventsController < ApplicationController
  layout "static_pages"
  
  def index
    @articles = Event.all.order(created_at: "DESC")
    @events = Event.where(tag: 1).order(created_at: "DESC")
    @news = Event.where(tag: 2).order(created_at: "DESC")
  end

  def show
    @event = Event.find(params[:id])
  end
end
