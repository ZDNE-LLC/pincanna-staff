class Support::PasswordResetsMailer < ApplicationMailer
  layout 'support/mailer'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support.password_resets_mailer.new_request.subject
  #
  def new_request(request_id)
    @request = Support::PasswordResetRequest.find(request_id).decorate

    mail to: "System Administrator <#{Rails.application.credentials.admin_email}>",
         from: "PincannaRx Support <staff-support@pincanna.org>",
         subject: "Password Reset Requested",
         cc: "#{@request.user.name} <#{@request.user.email}>"
  end

  def completed(request_id, temp_password)
    @request = Support::PasswordResetRequest.find(request_id)
    @temp_password = temp_password

    mail to: "#{@request.user.name} <#{@request.user.email}>",
         from: "PincannaRx Support <staff-support@pincanna.org>",
         subject: "Your new password",
         cc: "System Administrator <#{Rails.application.credentials.admin_email}>"
  end
end
