class Story < ApplicationRecord
  TAGS = ["BDSM", "Public", "LGBTQ+", "Threesome", "Horror", "Romance", "Leather", "Feet", "Furry", "Fantasy", "Accounting"]
  belongs_to :author, class_name: "User"
  has_many :readings
  has_many :favorites
  has_many :reactions

  validates :title, :content, presence: true
  validate :tags_should_be_in_the_list

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:title, :tags],
                  associated_against: {
                    author: [:username]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def user_favorite(user)
    self.favorites.pluck(:user_id).include?(user.id)
  end

  def average_reactions
    upvoted = 0
    downvoted = 0
    self.reactions.each do |reaction|
      reaction.upvoted ? upvoted += 1 : downvoted += 1
    end
    upvoted - downvoted
  end

  private

  def tags_should_be_in_the_list
    errors.add(:tags, :inclusion) if (TAGS & tags).size != tags.size
  end
end
