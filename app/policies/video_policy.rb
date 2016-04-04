class VideoPolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end

  def create?
    user
  end

end
