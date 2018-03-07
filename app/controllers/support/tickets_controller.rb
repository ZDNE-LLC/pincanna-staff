class Support::TicketsController < ApplicationController
  before_action :ensure_gsuite

  def index
    @tickets = current_user.support_tickets
  end

  def new
    @ticket = current_user.support_tickets.new
  end

  def create
    @ticket = current_user.support_tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
    @ticket = Support::Ticket.find params[:id]
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
