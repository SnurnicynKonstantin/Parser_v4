require 'rails_helper'

describe ParserCourse do
  context 'get new' do
    it 'data hash from get_current_course method' do
      parser = ParserCourse.new

      data_json = '{"query":{"count":2,"created":"2016-03-22T14:59:56Z","lang":"ru-RU","results":{"rate":[{"id":"USDRUB","Name":"USD/RUB","Rate":"67.8541","Date":"3/22/2016","Time":"12:51pm","Ask":"67.8671","Bid":"67.8541"},{"id":"EURRUB","Name":"EUR/RUB","Rate":"76.1783","Date":"3/22/2016","Time":"12:51pm","Ask":"76.2046","Bid":"76.1519"}]}}}'
      allow(parser).to receive(:prepare_data) { JSON.parse(data_json) }

      parser.get_current_course
      parse_course = parser.course

      expect(parse_course['Date']).to_not be_nil
      parse_course['USD/RUB'].should_not be_nil
      parse_course['EUR/RUB'].should_not be_nil
    end

    #it 'JSON data' do
    #  url = 'https://query.yahooapis.com/v1/public/yql?q=select+*+from+yahoo.finance.xchange+where+pair+=+%22USDRUB,EURRUB%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback='
    #  parser = ParserCourse.new
    #  data = parser.send(:prepare_data, url)
    #  data['query'].should_not be_nil
    #end


  end
end