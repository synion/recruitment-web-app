require 'csv'

class UsersCsvExport
  ATTRIBUTES = %w{email age gender}

  def initialize(users)
    @users = users
  end

  def generate
    CSV.generate do |csv|
      csv << ATTRIBUTES + ["Interests"]
      @users.each do |user|
        csv << user_column(user)
      end
    end
  end

  private

  def user_column(user)
    attribute_columns(user) + interest_column(user)
  end

  def attribute_columns(user)
    ATTRIBUTES.map { |column| user.send(column) }
  end

  def interest_column(user)
    [user.interests.pluck(:name).join("\n")]
  end
end
