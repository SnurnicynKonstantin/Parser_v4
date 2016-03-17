class CoursesController < ApplicationController

  def index
    data = CoursePolicy::Scope.new(current_user, Course).resolve
    render :json => data
  end

  def create
    authorize Course
    GetCoursesInfoJob.perform_later
    parser = ParserCourse.new
    parser.get_current_course
    parse_course = parser.course

    one_course = Course.find_or_create_by(date: DateTime.parse(parse_course['Date'])) do |course|
      course.usd = parse_course['USD/RUB']
      course.eur = parse_course['EUR/RUB']
      course.date = parse_course['Date']
    end
    current_user.courses << one_course unless current_user.courses.exists?(one_course.id)
  end
end