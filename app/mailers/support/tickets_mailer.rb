class Support::TicketsMailer < ApplicationMailer
  layout 'support/mailer'
  def ticket_created(ticket_id)
    @ticket = Support::Ticket.find(ticket_id)

    mail to: @ticket.user.email,
      from: 'staff-support@pincanna.org',
      subject: "[#{@ticket.ticket_number}] New Support Ticket",
      cc: Rails.application.credentials.admin_email
  end
end
