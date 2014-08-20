class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :coffee, presence: true
  validates :water, presence: true
  validates :seconds, presence: true
  validates :description, presence: true
end
