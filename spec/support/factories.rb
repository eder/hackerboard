FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email) {|i| "john#{i}@example.org"}
    password "test"
    password_confirmation "test"
  end

  factory :category do
    name "Some category"
  end

  factory :question do
    title "Some title"
    body "Some question"
    association :category
    association :user
  end

  preload do
    factory(:john) { FactoryGirl.create(:user, :email => "john@example.org") }
    factory(:ruby) { FactoryGirl.create(:category, :name => "Ruby") }
    factory(:what_is_enum) do
      FactoryGirl.create(:question,
        :category => categories(:ruby),
        :user => users(:john)
      )
    end
  end
end