class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name , null:false
      t.string :address
      t.string :number
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
