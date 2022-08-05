class ShoppingCartPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def show_active?
    record.user == user
  end

  def buy?
    record.user == user
  end
end
