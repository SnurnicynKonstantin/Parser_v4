class CoursePolicy
  attr_reader :user, :model

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      user && user.admin? ?  scope.all : user.courses
    end
  end

  def initialize(user, model)
    @user = user
    @user = model
  end

  def create?
    user
  end
end
