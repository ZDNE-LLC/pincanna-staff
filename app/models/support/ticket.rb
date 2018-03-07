# == Schema Information
#
# Table name: support_tickets
#
#  body          :text             not null
#  created_at    :datetime         not null
#  id            :uuid             not null, primary key
#  status        :integer          default("submitted"), not null
#  subject       :string           not null
#  ticket_number :string           not null
#  updated_at    :datetime         not null
#  urgency       :integer          default("normal"), not null
#  user_id       :uuid
#
# Indexes
#
#  index_support_tickets_on_ticket_number  (ticket_number) UNIQUE
#  index_support_tickets_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Support::Ticket < ApplicationRecord
  belongs_to :user
  enum urgency: [:normal, :urgent, :critical]
  enum status: [:submitted, :in_progress, :completed, :canceled]

  before_create :set_ticket_number

  private

  def set_ticket_number
    self.ticket_number = loop do
      temp = /T\d{3}-\d{4}/.gen
      break temp unless self.class.exists?(ticket_number: temp)
    end
  end
end
