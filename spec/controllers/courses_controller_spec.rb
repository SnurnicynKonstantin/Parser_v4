require 'rails_helper'
require 'yaml'

describe CoursesController do
  include Devise::TestHelpers

  before(:each) {
    user = create(:first_user)
    sign_in user
  }

  it 'get courser in JSON format' do
    post :create

    get :index
    expect(response.status).to eq(200)
    data = JSON.parse(response.body)
    expect(data[0]['eur']).to_not be_nil
    expect(data[0]['usd']).to_not be_nil
  end

  it 'adding new course in DB' do
    count = Course.count
    post :create
    expect(count + 1).to eq(1)
    expect(Course.last.usd).to_not be_nil
  end
end