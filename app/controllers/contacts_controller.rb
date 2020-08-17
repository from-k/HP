class ContactsController < ApplicationController
  layout "static_pages"

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.status = 1
    if @contact.save
      if Rails.env.production?
        notifier = Slack::Notifier.new(
          "https://hooks.slack.com/services/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",
          channel: "#お問い合わせ"
        )
        contact_form = "日時:#{@contact.created_at}\n企業名/団体名:#{@contact.company}\n担当:#{@contact.name}\nメールアドレス:#{@contact.email}\nお問い合わせ内容:#{@contact.content}"
        notifier.ping contact_form
      end
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
