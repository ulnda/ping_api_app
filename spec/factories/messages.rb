# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	
  factory :message do
  	association :sender, factory: :user
  	association :receiver, factory: :contact
    text "Some message"
  end
end
