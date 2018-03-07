# == Schema Information
#
# Table name: comments
#
#  body             :text
#  commentable_id   :uuid
#  commentable_type :string
#  created_at       :datetime         not null
#  id               :uuid             not null, primary key
#  subject          :string
#  updated_at       :datetime         not null
#  user_id          :uuid
#
# Indexes
#
#  index_comments_on_commentable_type_and_commentable_id  (commentable_type,commentable_id)
#  index_comments_on_user_id                              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :comment do
    commentable nil
    subject "MyString"
    body "MyText"
    user nil
  end
end
