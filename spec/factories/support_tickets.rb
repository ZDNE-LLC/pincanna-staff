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

FactoryBot.define do
  factory :support_ticket, class: 'Support::Ticket' do
    subject "MyString"
    body "MyText"
    urgency 1
    status 1
    user nil
  end
end
