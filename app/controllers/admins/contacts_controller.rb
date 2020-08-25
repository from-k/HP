class Admins::ContactsController < ApplicationController
  before_action :authenticate_user!
  layout "admins"

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      flash.now[:success] = "#{@contact.company}の対応状況を更新しました"
    else
      flash[:alert] = "対応状況の更新に失敗しました"
    end
    respond_to do |format|
      format.js
    end
  end


  private

    def contact_params
      params.require(:contact).permit(:status)
    end
end
