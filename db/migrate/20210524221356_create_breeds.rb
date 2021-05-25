class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.references :bird, null: false, foreign_key: {on_delete: :cascade}
      t.string :breed_name , null:false
      t.timestamps
    end
  end
end
