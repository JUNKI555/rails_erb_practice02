class DeleteForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :user_database_authentications, name: :fk_user_database_authentications_on_user_public_uid
  end
end
