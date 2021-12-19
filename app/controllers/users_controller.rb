class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update ]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    respond_to { |format| format.html { redirect_to users_path, alert: "You do not have access to change admin user" } } if @user.role.eql? "admin"
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "Users was successfully updated." }
      end
    end
  end

  private

  def authenticate_user!
    super()
    respond_to { |format| format.html { redirect_to root_path, alert: "You do not have access to view this page" } } unless current_user.role.eql? "admin"
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_role_id)
  end
end
