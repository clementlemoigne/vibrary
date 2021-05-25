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

  private

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
