class UserPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def destroy?
    user.present? && user.admin? && (user.id != record.id)
  end
end
