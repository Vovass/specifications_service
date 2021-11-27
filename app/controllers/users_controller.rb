class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  private

  def authenticate_user!
    super()
    respond_to { |format| format.html { redirect_to root_path, alert: "You do not have access to view this page" } } unless current_user.role.eql? "admin"
  end
end
