class StoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      stories = scope.all.reject { |story| story.tags.any? { |tag| user.blacklist.include?(tag) } }
      Story.where(id: stories.map(&:id))
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user  # Only story creator can update it
  end

  def destroy?
    record.user == user  # Only story creator can destroy it
  end
end
