class Comment < ApplicationRecord
belongs_to :user
belongs_to :article

validates :body, presence: true, length: {maximum: 250, too_long: "%{count} characters is the maximum allowed for comments."}
validates :user_id, presence: {message: "You must be signed in to comment."}

end
