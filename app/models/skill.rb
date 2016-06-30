class Skill < ActiveRecord::Base
  has_many :relationships, dependent: :destroy
  validates :name, presence: true
  extend OrderAsSpecified
end
