require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:legacy_user) { rhohub_legacy_user }

  context "Authenticate legacy users and re-encrypt password" do
    it "Should authenticate for legacy password users and migrate the password to BCrypt" do
      expect( legacy_user.valid_password?("somevalidpassword") ).to eq(true)
      legacy_user.reload
      expect( legacy_user.clearance_legacy_password ).to eq(false)
      expect{ BCrypt::Password.new(legacy_user.encrypted_password) }.not_to raise_error

      #once is migrated the password should be still working
      expect( legacy_user.valid_password?("somevalidpassword") ).to eq(true)
    end
  end
end