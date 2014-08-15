class Recipe < ActiveRecord::Base

  has_many :recipe_items

  validates :title, presence: true
  validates :coffee, presence: true
  validates :water, presence: true
  validates :seconds, presence: true
  validates :description, presence: true
end
