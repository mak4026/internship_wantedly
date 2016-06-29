class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  has_many :has_skill, class_name: "Relationship", dependent: :destroy
  has_many :add_skill, class_name: "Relationship", foreign_key: "adder_id", dependent: :destroy
  has_many :skills, through: :has_skill



  def plus_one(other_user, ability)
    add_skill.create(user_id: other_user.id, skill_id: ability.id)
  end

  def delete_skill(ability)
    abilities = has_skill.where(skill_id: ability.id).find_each{ |a|
    	a.destroy
    }
  end

  def skill_having?(ability)
  	skills.include?(ability)
  end

  def skills_list
    ordered_keys = skills.group('skills.id').order('count_all desc').count.keys
    skills.group(:id).order_as_specified(id: ordered_keys)
  end
end
