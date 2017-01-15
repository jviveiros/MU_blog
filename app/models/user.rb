class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :comments
  has_many :articles
  
end
