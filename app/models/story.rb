class Story < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :readings
  has_many :favorites
  has_many :reactions

  validates :title, :content, presence: true
end
