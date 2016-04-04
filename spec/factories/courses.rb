FactoryGirl.define do
  factory :course do
    usd 12
    eur 12

    factory :first_course do
      date '2016-02-23 00:00:00'
    end

    factory :second_course do
      date '2016-02-25 12:00:00'
    end
  end
end