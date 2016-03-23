class Course < ActiveRecord::Base
  has_and_belongs_to_many :users

  after_create :send_statistics

  def self.create_course
    parser = ParserCourse.new
    parser.get_current_course
    parse_course = parser.course

    Course.find_or_initialize_by(date: DateTime.parse(parse_course['Date'])) do |course|
      course.usd = parse_course['USD/RUB']
      course.eur = parse_course['EUR/RUB']
      course.date = parse_course['Date']
    end
  end

  def send_statistics
    GetCoursesInfoJob.perform_later
  end
end
