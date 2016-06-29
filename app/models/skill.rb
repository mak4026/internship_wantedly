class Skill < ActiveRecord::Base
  has_many :relationship
  validates :name, presence: true
end
