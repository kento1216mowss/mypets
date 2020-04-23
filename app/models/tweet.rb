class Tweet < ApplicationRecord
  mount_uploader :image, FrontcoverUploader
  belongs_to :user
  has_many :commnts
end
