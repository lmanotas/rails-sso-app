class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def valid_password?(password)
    if self.clearance_legacy_password
      return false unless Digest::SHA1.hexdigest( old_encrypt_format(password) ) == encrypted_password
      migrate_password password
      return true
    else
      super
    end
  end

  protected

  def migrate_password(password)
    bcrypt_password = Devise.bcrypt(User, password)
    self.update_attributes({ clearance_legacy_password: false, encrypted_password: bcrypt_password })
  end

  def old_encrypt_format(password)
    "--#{salt}--#{password}--"
  end
end