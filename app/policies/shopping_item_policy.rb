class ShoppingItemPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    record.wand.user != user && record.wand.available
  end

  def destroy?
    record.shopping_cart.user == user
  end
end
