class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  validates :title, length: { in: 1..200 }
  validates :content, presence: true

end
