# Preview all emails at http://localhost:3000/rails/mailers/support/password_resets
class Support::PasswordResetsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/support/password_resets/new_request
  def new_request
    Support::PasswordResetsMailer.new_request
  end

end
