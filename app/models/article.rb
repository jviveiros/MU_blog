class Article < ApplicationRecord
belongs_to :user
has_many :comments

validates :title, presence: true, length: {maximum: 200, too_long: "%{count} characters is the maximum allowed for the title."}
validates :body, presence: true, length: {maximum:2500, too_long: "%{count} characters is the maximum allowed for the body of your post."}
validates :user_id, presence: {message: "You must be signed in to post."}


end
