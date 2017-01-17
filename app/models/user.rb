class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :username, presence: true, uniqueness: {message: "%{value} has already been taken"}
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: {message: "%{value} has already been taken."}, presence: true

end
