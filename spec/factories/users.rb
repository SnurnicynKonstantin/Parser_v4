FactoryGirl.define do
  factory :user do
    password              '12345678'
    password_confirmation '12345678'

    factory :first_user do
      name  'admine'
      email 'admin@mail.ru'
    end

    factory :second_user do
      name  'jonny'
      email 'john@mail.ru'
    end
  end
end