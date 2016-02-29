class CoursesController < ApplicationController

  def index
    if current_user
      if current_user.admin?
        data = Course.all
      else
        data = current_user.courses
      end

      render :json => data
    end
  end

  def create
    if current_user
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

end