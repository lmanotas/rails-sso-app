# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email
  	username
  	api_token
  	password "somevalidpassword"
  	salt "123"
  end
end
