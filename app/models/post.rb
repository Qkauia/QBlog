class Post < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :category

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :body, presence: true
  
end
