class AddConfirmableToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
    end

    User.all.each do |u|
      u.confirm! if u.email_confirmed?
    end
  end
end