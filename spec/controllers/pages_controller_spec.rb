require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  context "not signed in" do
    it "should render sign_in if user isn't logged" do
      get 'index'
      expect(response.status).to eq(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context "signed_in user" do
    it "should render index when the user is signed_in" do
      signed_in_user
      get 'index'
      expect(response).to render_template('index')
    end
  end
end