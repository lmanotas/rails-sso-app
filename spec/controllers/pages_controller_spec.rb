require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  context "on index" do
    let(:user) { FactoryGirl.create(:user) }

    it "should render sign_in if user isn't logged" do
      get 'index'
      response.status.should == 302
      response.should redirect_to new_user_session_path
    end

    it "should render index when the user is signed_in"
  end
end