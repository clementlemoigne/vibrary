class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stories, foreign_key: :author_id
  has_many :favorites
  has_many :favorite_authors
  has_many :reactions
  has_many :readings

  # before_validation :reject_blank_subset_arrays

  def is_favorite?(author)
    favorite_authors.map { |fav| fav.author }.include?(author)
  end

  private

  def reject_blank_subset_arrays
    self.whitelist&.reject!(&:blank?)
    self.blacklist&.reject!(&:blank?)
  end

  def whitelist_should_be_in_the_list
    if (Story::TAGS & whitelist).size != whitelist.size
      errors.add(:tags, :inclusion)
    end
  end

  def blacklist_should_be_in_the_list
    if (Story::TAGS & blacklist).size != blacklist.size
      errors.add(:tags, :inclusion)
    end
  end
end
