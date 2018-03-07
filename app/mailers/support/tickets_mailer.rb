class Support::TicketsMailer < ApplicationMailer
  layout 'support/mailer'
  def ticket_created(ticket_id)
    @ticket = Support::Ticket.find(ticket_id)

    mail to: "#{@ticket.user.name} <#{@ticket.user.email}>",
      from: 'PincannaRx Support <staff-support@pincanna.org>',
      subject: "[#{@ticket.ticket_number}] New Support Ticket",
      cc: "System Administrator <#{Rails.application.credentials.admin_email}>"
  end

  def status_updated(ticket_id, old_status)
    @ticket = Support::Ticket.find(ticket_id)
    @old_status = old_status
    mail to: "#{@ticket.user.name} <#{@ticket.user.email}>",
    from: 'PincannaRx Support <staff-support@pincanna.org>',
    subject: "[#{@ticket.ticket_number}] Ticket Status Updated"
  end
end
