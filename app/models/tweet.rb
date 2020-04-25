class Tweet < ApplicationRecord
  mount_uploader :image, FrontcoverUploader
  belongs_to :user
  has_many :comments  
 
  validates :image, presence: true
end