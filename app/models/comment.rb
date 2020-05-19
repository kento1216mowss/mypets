class Comment < ApplicationRecord
 belongs_to :tweet               #tweetsテーブルとのアソシエーション
 belongs_to :user       
 validates :text, presence: true
end
