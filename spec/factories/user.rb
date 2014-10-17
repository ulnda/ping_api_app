FactoryGirl.define do

  factory :user do
    phone '+79020000000'

    factory :contact do
    	phone '+79030000000'
    	authenticated true
    end
  end
end