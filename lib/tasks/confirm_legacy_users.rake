namespace :legacy_users do
  desc "AutoConfirm for legacy users with already confirmed emails"
  task :confirm => :environment do
    errors = []
    User.all.each do |u|
      if u.email_confirmed? and !u.confirmed?
        puts "Confirm for: #{u.email}"
        puts "***"
        if u.confirm!
          puts true
        else
          errors << { user_id: u.id, email: u.email, errors: u.errors.full_messages }
          puts false
        end
      end
    end

    puts "Errors"
    puts errors.inspect
  end
end