class User::DatabaseAuthentication < ApplicationRecord
  devise :database_authenticatable, :validatable

  belongs_to :user, foreign_key: :user_public_uid, primary_key: :public_uid

  self.primary_key = :user_public_uid
end
