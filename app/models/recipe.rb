class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes

  mount_uploader :img, RecipeUploader

  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 500}
  validates :chef_id, presence: true
end
