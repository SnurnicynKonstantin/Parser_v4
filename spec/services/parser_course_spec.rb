require 'rails_helper'
require 'yaml'

describe ParserCourse do
  context 'get new' do
    it 'data hash from get_current_course method' do
      parser = ParserCourse.new
      data_json = YAML.load_file("#{::Rails.root}/spec/fixtures/course.yml")
      p data_json
      allow(parser).to receive(:prepare_data) { JSON.parse(data_json["data"]) }

      parser.get_current_course
      parse_course = parser.course

      expect(parse_course['Date']).to_not be_nil
      expect(parse_course['USD/RUB']).to_not be_nil
      expect(parse_course['EUR/RUB']).to_not be_nil
    end

  end
end
