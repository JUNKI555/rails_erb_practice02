# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id:false do |t|
      t.string :public_uid, null:false, primary_key: true
      t.string :name, null:false

      t.timestamps null: false
    end
  end
end
