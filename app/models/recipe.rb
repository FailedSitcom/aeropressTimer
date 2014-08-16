class Recipe < ActiveRecord::Base

  validates :title, presence: true
  validates :coffee, presence: true
  validates :water, presence: true
  validates :seconds, presence: true
  validates :description, presence: true
end
