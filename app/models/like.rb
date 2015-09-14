class Like < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  validates_uniqueness_of :chef, scope: :recipe


  scope :filter_like, -> {where like: true}
  scope :filter_dislike, -> {where like: false}

end
