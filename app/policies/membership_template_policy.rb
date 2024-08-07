class MembershipTemplatePolicy < ApplicationPolicy
  def new?
    false
  end

  def edit?
    new?
  end
end
