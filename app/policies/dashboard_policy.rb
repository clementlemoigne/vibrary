class DashboardPolicy < Struct.new(:user, :dashboard)
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
