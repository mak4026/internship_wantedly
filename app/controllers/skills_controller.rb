class SkillsController < ApplicationController
  before_action :authenticate_user!
  def create
    added_user = User.find(params[:added_id])

    if Skill.exists?(name: skill_params[:name])
      @skill = Skill.find_by(name: skill_params[:name])
    else
      @skill = Skill.new(skill_params)
      if !@skill.save
        flash[:alert] = "新規スキルの作成に失敗しました"
        return redirect_to added_user
      end
    end

    if current_user.plus_one(added_user,@skill)
      flash[:notice] = @skill.name + " に +1 しました"
    else
      flash[:alert] = @skill.name + " への +1 に失敗しました"
    end

    return redirect_to added_user
  end

  def destroy
  end

  private

    def skill_params
      params.require(:skill).permit(:name)
    end
end
