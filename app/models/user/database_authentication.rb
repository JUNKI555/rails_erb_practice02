class User::DatabaseAuthentication < ApplicationRecord
  devise :database_authenticatable, :validatable

  belongs_to :user
end
