module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end

  def add_comment(user, subject, body)
    self.comments.create(user: user, subject: subject, body: body)
  end
end