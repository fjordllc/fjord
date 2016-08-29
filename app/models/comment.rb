class Comment < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :user
  validates :body, presence: true
  validates :date, presence: true

  after_commit CommentCallbacks.new
end
