class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.status = 1
    if @contact.save
      flash[:success] = "お問い合わせの送信が完了しました。"
      redirect_to contact_path
    else
      render "new"
    end
  end


  private
    def contact_params
      params.require(:contact).permit(:company, :name, :email, :tel,
                          :opportunity_to_know, :opportunity_to_know_other,
                          :content)
    end
end


# def create
#     @user = User.new(user_params)
#     if @user.save
#       @user.send_activation_email
#       flash[:info] = "Please check your email to activate your account."
#       redirect_to root_url
#     else
#       render "new"
#     end
#   end
