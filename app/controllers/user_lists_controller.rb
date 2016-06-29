class UserListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @skills = @user.skills_list.paginate(page: params[:page])
  end
end
