class UserMailer < ActionMailer::Base
  default :from => "notifications@example.com"

  def welcome_email(user)
    @user = user
#    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  def course_info_email(count, data)
    @count_courses = count
    @all_courses = data
#    @url  = "http://example.com/login"
    mail(:to => ENV['admin_email'], :subject => "Course Info Email")
  end

end