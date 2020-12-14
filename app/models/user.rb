class User < ApplicationRecord
  generate_public_uid
  devise :authenticatable

  has_one :database_authentication, foreign_key: :user_public_uid, primary_key: :public_uid

  self.primary_key = :public_uid
end
