require 'rails_helper'

describe User do
  context 'validations' do
    let(:user) { create(:first_user) }

    it 'new user must be simple User' do  #Проверка работоспособности функции set_default_role
      expect(user[:role]).to eq(User.roles[:user])
    end

    it 'requires the email to look like an email' do
      user.email = 'john'
      expect(user).to_not be_valid
    end
  end
end

