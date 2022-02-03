class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def edit?
    user.admin?
  end
  def update?
    user.admin?
  end
end
