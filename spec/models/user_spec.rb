require 'rails_helper'

describe User do

  context 'providers' do
    it { should have_many(:providers) }
  end

  let(:valid_attributes) {
    {
        name: 'John',
        email: 'john@doe.com',
        password: '12345678',
        password_confirmation: '12345678'
    }
  }

  context 'validations' do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it 'requires an email' do
      expect(user).to validate_presence_of(:email)
    end

    it 'requires a unique email' do
      expect(user).to validate_uniqueness_of(:email)
    end

    it 'requires the email to look like an email' do
      user.email = 'john'
      expect(user).to_not be_valid
    end
  end

end

#https://github.com/eliotsykes/rspec-rails-examples/blob/master/spec/models/user_spec.rb

#user_model
# validation
# проверка полей
# иммет ли index у полей
# Проверка атрибутов
# проверка методов

#controllers
# Переход по разным путям

# routing
# до пользователя



#---------------------------------------
# тест сервиса
# переделать uid
# devise в отдельном контроллере (переход к пользователю)  +-
# phasade (фасад)
# sceduler - radis
# cucumber   +
# jobs отдельно

#bundle exec rspec spec
#rake jobs:workoff                   
#https://habrahabr.ru/post/111480/ - статья про тесты
#http://railscasts.com/episodes/155-beginning-with-cucumber - Разобрать пример
#http://railstutorial.ru/chapters/3_2/sign-in-sign-out - Хороший пример
#https://gist.github.com/zhengjia/428105 - Команды Capybara

#heroku
#frendly_id          +
#delayed_job_web     +
#Кастомный валидатор
#http://stackoverflow.com/questions/10084355/eager-loading-and-lazy-loading-in-rails Ленивая, жадная загрузка
#Thambsup рэйтинг    +
#curl
#https://habrahabr.ru/post/62958/ про cucumber
#Загрузка аватарки с сервисов

#http://stackoverflow.com/questions/17366006/fatal-remote-heroku-already-exists

#sunspot_rails gem
#тесты
#