class CoursesController < ApplicationController

  def index
    data = CoursePolicy::Scope.new(current_user, Course).resolve
    render :json => data
  end

  def create
    authorize Course
    course = Course.create_course

    if !current_user.courses.exists?(course.id)
      current_user.courses << course
    end

    render nothing: true, status: 200
  end
end
