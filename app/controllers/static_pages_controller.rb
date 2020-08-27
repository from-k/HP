class StaticPagesController < ApplicationController
  def home
    @events = Event.all.order(created_at: "DESC").first(3)
  end

  def about
  end

  def activity
  end
end
