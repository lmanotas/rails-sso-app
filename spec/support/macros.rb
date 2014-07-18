module Macros
  def rhohub_legacy_user
    FactoryGirl.create(:user, 
      encrypted_password: Digest::SHA1.hexdigest("--123--somevalidpassword--"), 
      clearance_legacy_password: true)
  end

  def rhomobile_user
    u = FactoryGirl.create(:user)
    u.confirm!
    return u
  end

  def signed_in_user
    sign_in(rhomobile_user)
  end
end