require 'rails_helper'
require 'yaml'

describe UsersController do
  include Devise::TestHelpers

  let(:user) { create(:first_user)}
  before(:each) {
    sign_in user
  }

  it 'must show user page by friendly_id' do
    get :show, id: user
    expect(response.status).to eq(200)
    expect(assigns(:user)).to eq(user)
  end

  it 'vote_up for user' do
    count = user.vote_count(:all)
    xhr :post, :vote_up, id: user.id
    expect(user.vote_count(:all)).to eq(count + 1)
  end

  it 'vote_down for user' do
    count = user.vote_count(:all)
    xhr :post, :vote_up, id: user.id
    xhr :post, :vote_down, id: user.id
    expect(user.vote_count(:all)).to eq(count)
  end

  # it 'user seaching info' do
  #   xhr :post, :search, name: user.names
  #   expect(assigns(:user)).to eq(user)
  # end
end