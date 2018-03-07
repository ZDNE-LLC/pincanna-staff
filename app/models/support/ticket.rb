# == Schema Information
#
# Table name: support_tickets
#
#  body       :text             not null
#  created_at :datetime         not null
#  id         :uuid             not null, primary key
#  status     :integer          default(0), not null
#  subject    :string           not null
#  updated_at :datetime         not null
#  urgency    :integer          default(0), not null
#  user_id    :uuid
#
# Indexes
#
#  index_support_tickets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Support::Ticket < ApplicationRecord
  belongs_to :user
  enum urgency: [:normal, :urgent, :critical]
  enum status: [:submitted, :in_progress, :completed]
end
