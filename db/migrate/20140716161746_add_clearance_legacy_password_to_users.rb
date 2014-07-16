class AddClearanceLegacyPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :clearance_legacy_password, :boolean, default: false
    User.all.each {|user| user.update_attribute(:clearance_legacy_password, true)}
  end
end
