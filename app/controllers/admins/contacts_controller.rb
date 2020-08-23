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
      respond_to do |format|
        format.html {redirect_to admins_contacts_path}
        format.js
      end
    else
      flash[:danger] = "対応状況の更新に失敗しました"
      redirect_back(fallback_location: admins_contacts_path)
    end
  end


  private

    def contact_params
      params.require(:contact).permit(:status)
    end
end
