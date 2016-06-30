class UserListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    _skills, @counts = @user.skills_list
    @skills = _skills.paginate(page: params[:page])
    @new_skill = Skill.new
  end
end
