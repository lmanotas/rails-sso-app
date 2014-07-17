FactoryGirl.define do
  sequence(:name)  {|n| "Person #{n}"}
  sequence(:first_name)  {|n| "Person #{n}"}
  sequence(:last_name)  {|n| "Person #{n}"}
  sequence(:email) {|n| "person-#{n}@example.com" }
  sequence(:username)  {|n| "Person #{n}"}
  sequence(:mobile_number)  {|n| "41443643533"}
  sequence(:api_token)  {|n| "12345abcde"}
end