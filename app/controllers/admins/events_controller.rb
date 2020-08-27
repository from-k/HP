class Admins::EventsController < ApplicationController
  before_action :authenticate_user!
  include Admins::EventsHelper
  layout "admins"

  def index
    @events = Event.all.order(created_at: "DESC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "記事を公開しました"
      redirect_to admins_events_path
    else
      render "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "記事を更新しました"
      redirect_to admins_events_path
    else
      render "admins/events/edit"
    end
  end

  def destroy
    @events = Event.all
    Event.find(params[:id]).destroy
    flash[:sucsecc] = "記事を削除しました"
    respond_to do |format|
      format.js
    end
  end


  private
    def event_params
      params.require(:event).permit(:title, :content, :event_image, :holded_at,
                                    :tag)
    end
end
