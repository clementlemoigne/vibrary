class StoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.reject{ |story| story.tags.any?{ |tag| user.blacklist.include?(tag)}}
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
