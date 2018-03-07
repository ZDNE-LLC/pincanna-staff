class Support::TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tickets = current_user.support_tickets
  end

  def new
    @ticket = current_user.support_tickets.new
  end

  def create
    @ticket = current_user.support_tickets.new(ticket_params)
    if @ticket.save
      Support::TicketsMailer.ticket_created(@ticket.id).deliver_later!
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
    @ticket = Support::Ticket.find params[:id]
  end

  def cancel
    @ticket = Support::Ticket.find params[:id]
    @status = @ticket.status
    if @ticket.canceled!
      Support::TicketsMailer.status_updated(@ticket.id, @status).deliver_later!
      redirect_to @ticket, notice: 'This ticket has been canceled.'
    end
  end

  private

  def ticket_params
    params.require(:support_ticket).permit(:urgency, :subject, :body)
  end

  def ensure_gsuite
    unless current_user
      redirect_to user_google_oauth2_omniauth_authorize_url
    end
  end
end
