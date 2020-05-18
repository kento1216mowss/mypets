class ApplicationRecord < ActiveRecord::Base
  validates :image, presence: true

  self.abstract_class = true
end
