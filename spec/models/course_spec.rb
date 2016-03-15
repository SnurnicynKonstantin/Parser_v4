require 'rails_helper'

describe Course do
  context 'relationships' do
    it { should have_and_belong_to_many(:users) }
  end
end