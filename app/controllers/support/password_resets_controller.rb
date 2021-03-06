class Support::PasswordResetsController < ApplicationController
  def new
    @request = Support::PasswordResetRequest.new
    @previous_requests = current_user.password_resets.where(completed: true).decorate
  end

  def create
    @request = Support::PasswordResetRequest.new(user: current_user)
    if @request.save
      Support::PasswordResetsMailer.new_request(@request.id).deliver_later!
      redirect_to new_support_password_reset_path, notice: 'Password reset requested.'
    else
      render :new
    end
  end
end
