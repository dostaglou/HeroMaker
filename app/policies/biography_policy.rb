class BiographyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end

  def new?
    true
  end

  def create?
    record.character.user = user
  end

  def edit?
    update?
  end

  def update?
    record.character.user = user
  end

  def destroy?
    record.character.user = user
  end
end
