class UserPolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end


  def show?
    user == model or user.admin?
  end
end
