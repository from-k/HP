class Admins::EventsController < ApplicationController
  before_action :authenticate_user!
  include Admins::EventsHelper
  layout "admins"

  def index

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

  end

  def update

  end

  def destroy

  end


  private
    def event_params
      params.require(:event).permit(:title, :content, :event_image, :holded_at,
                                    :tag)
    end
end
