class Manager::PasswordResetCompletionsController < ApplicationController
  before_action :authenticate_admin_user!
  def index
    @requests = Support::PasswordResetRequest.all.where(completed: false)
  end

  def process_request
    @request = Support::PasswordResetRequest.find params[:request][:request_id]
    if @request.update(completed: true)
      Support::PasswordResetsMailer.completed(@request.id, params[:request][:temp_password]).deliver_now!
      redirect_to manager_password_reset_completions_url, notice: 'Completed.'
    end
  end
end
