class Users::InvitationsController < Devise::InvitationsController
  def new
    self.resource = resource_class.new
    render :layout => "admins"
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end


  private

    def after_invite_path_for(inviter, invitee = nil)
      new_user_invitation_path
    end

    def after_accept_path_for(resource)
      admins_contacts_path
    end
end
