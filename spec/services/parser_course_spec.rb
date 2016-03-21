require 'rails_helper'

describe ParserCourse do
  context 'get new' do
    it 'data hash from get_current_course method' do
      parser = ParserCourse.new
      parser.get_current_course
      parse_course = parser.course

      parse_course['Date'].should_not be_nil
      parse_course['USD/RUB'].should_not be_nil
      parse_course['EUR/RUB'].should_not be_nil
    end

    it 'JSON data' do
      url = 'https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22USDRUB,EURRUB%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
      parser = ParserCourse.new
      data = parser.send(:prepare_data, url)
      data['query'].should_not be_nil
    end
  end
end