class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments  
  has_many :likes, dependent: :destroy 
  validates :image, presence: true
  
   
end