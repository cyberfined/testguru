class Admin::BaseController < ActionController::Base
  layout 'application'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    unless current_user.admin?
      redirect_to :root, alert: "You aren't an admin"
    end
  end
end
