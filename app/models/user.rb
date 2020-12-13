class User < ApplicationRecord
  generate_public_uid
  devise :authenticatable

  has_one :database_authentication
end
