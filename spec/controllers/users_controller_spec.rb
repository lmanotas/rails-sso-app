require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) { rhomobile_user }
  let(:dk_app) { FactoryGirl.create(:"Doorkeeper::Application") }
  let(:dk_token) { FactoryGirl.create(:"Doorkeeper::AccessToken", resource_owner_id: user.id, application_id: dk_app.id) }

  context "Response" do
    it "should respond with the user information" do
      get :profile, :format => :json, :access_token => dk_token.token
      expect(response.body).to eq(user.to_json)
    end
  end

end