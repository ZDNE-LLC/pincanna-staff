# == Schema Information
#
# Table name: action_requests
#
#  body       :text             not null
#  completed  :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  id         :uuid             not null, primary key
#  type       :string           not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
# Indexes
#
#  index_action_requests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Support::PasswordResetRequest < ActionRequest
  include Commentable
  before_create :set_body

  def complete_request(temp_password)
    self.update(completed: true) && Support::PasswordResetsMailer.completed(self.id, temp_password).deliver_now
  end

  private
  def set_body
    self.body = "Password reset requested for #{self.user.name} (#{self.user.email})."
  end
end
