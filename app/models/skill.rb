class Skill < ActiveRecord::Base
  has_many :relationship, dependent: :destroy
  validates :name, presence: true
end
