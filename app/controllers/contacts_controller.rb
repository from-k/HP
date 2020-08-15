class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.status = 1
    if @contact.save
      notifier = Slack::Notifier.new(
        "https://hooks.slack.com/services/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",
        channel: "#お問い合わせ"
      )
      contact_form = "日時:#{@contact.created_at}\n企業名/団体名:#{@contact.company}\n担当:#{@contact.name}\nメールアドレス:#{@contact.email}\nお問い合わせ内容:#{@contact.content}"
      notifier.ping contact_form
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
