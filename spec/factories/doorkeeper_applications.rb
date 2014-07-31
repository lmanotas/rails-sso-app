FactoryGirl.define do
  factory :"Doorkeeper::Application" do
    name    		"TestApp"
    uid     		"some_uid"
    secret  		"some_secret_token"
    redirect_uri 	"http://example.com/oauth/callback"
  end
end