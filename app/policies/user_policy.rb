class UserPolicy < ApplicationPolicy
  def index?
    user.sign_in?
  end

  def destroy?
    user.present? && user.admin? && (user.id != record.id)
  end
end
