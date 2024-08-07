class MembershipTemplatePolicy < ApplicationPolicy
  def create?
    super
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
