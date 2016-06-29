class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :adder, class_name: "User"
  belongs_to :skill
  validates :user_id, presence: true
  validates :adder_id, presence: true
  validates :skill_id, presence: true
end
