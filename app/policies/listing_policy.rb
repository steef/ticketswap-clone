class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true # anyone can create
  end

  def update?
    record.user == user # only creator can edit
  end

  def destroy?
    record.user == user # only creator can destroy
  end
end
