module Macros
  def rhohub_legacy_user
    FactoryGirl.create(:user, 
      encrypted_password: Digest::SHA1.hexdigest("--123--somevalidpassword--"), 
      clearance_legacy_password: true)
  end
end