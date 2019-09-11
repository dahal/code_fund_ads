class AdministratorInvitationsController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_user

  # PUT /admin_invitations/:id
  # PATCH /admin_invitations/:id
  def update
    @user.invite!
    flash[:success] = t('devise.invitations.send_instructions', email: @user.email)
    redirect_to user_path(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
