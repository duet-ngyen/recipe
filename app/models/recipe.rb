class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes

  mount_uploader :img, RecipeUploader

  validates :title, :presence => true, :length => {:minimum => 6, :maximum => 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 500}
  validates :chef_id, presence: true
  default_scope -> {order(:updated_at => :desc)}

  def count_like
    self.likes.filter_like.size
  end

  def count_dislike
    self.likes.filter_dislike.size
  end

end
