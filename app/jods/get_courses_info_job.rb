class GetCoursesInfoJob < ActiveJob::Base

  def perform
    count_all_courses = Course.count
    all_courses = Course.all
    UserMailer.course_info_email(count_all_courses, all_courses).deliver_now
  end
end
