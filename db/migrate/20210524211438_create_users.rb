class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fullName
      t.string :email
      t.string :password_digest
      t.string :avatarUrl

      t.timestamps
    end
  end
end
