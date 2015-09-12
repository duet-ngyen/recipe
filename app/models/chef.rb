class Chef < ActiveRecord::Base
  has_many :recipes
  validates :name, presence: true, length: {minimum: 3, maximum: 100}
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
