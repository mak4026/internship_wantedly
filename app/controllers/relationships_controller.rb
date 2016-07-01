class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: :destroy
  def create
  	user = User.find(params[:user_id])
  	ability = Skill.find(params[:skill_id])
    if current_user.plus_one(user, ability)
      flash[:notice] = ability.name + " に +1 しました"
    else
      flash[:alert] = ability.name + " への +1 に失敗しました"
    end
    redirect_to user
  end

  def destroy
    skill = Skill.find(@relation.skill_id)
    @relation.destroy
    flash[:notice] = skill.name+" を -1 しました"
    redirect_to user_path id: @relation.user_id
  end

private
  def correct_user
    @relation = current_user.add_skill.find_by(id: params[:id])
    redirect_to root_path if @relation.nil?
  end
end
