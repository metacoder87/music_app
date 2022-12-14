class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :session_token
      t.boolean :activated
      t.string :activation_token

      t.timestamps
    end
  end
end
