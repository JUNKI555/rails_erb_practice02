class AddForeignKeyUserDatabaseAuthentications < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_database_authentications, :users, column: :user_public_uid , primary_key: :public_uid, on_update: :cascade, on_delete: :cascade, name: :fk_user_database_authentications_on_user_public_uid
  end
end
