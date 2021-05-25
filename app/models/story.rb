class Story < ApplicationRecord
  TAGS = ["BDSM", "Public", "LGBTQ+", "Threesome", "Horror", "Romance", "Leather", "Feet", "Furry", "Fantasy", "Accounting"]
  belongs_to :author, class_name: "User"
  has_many :readings
  has_many :favorites
  has_many :reactions

  validates :title, :content, presence: true
  validate :tags_should_be_in_the_list

  private

  def tags_should_be_in_the_list
    if (TAGS & tags).size != tags.size
      errors.add(:tags, :inclusion)
    end
  end
end
