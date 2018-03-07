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

class ActionRequest < ApplicationRecord
  belongs_to :user
end
