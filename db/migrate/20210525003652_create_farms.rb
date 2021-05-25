class CreateFarms < ActiveRecord::Migration[6.1]
  def change
    create_table :farms do |t|
      t.references :owner, null: false, foreign_key: {on_delete: :cascade}
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.references :bird, null: false, foreign_key: {on_delete: :cascade}
      t.references :breed, null: false, foreign_key: {on_delete: :cascade}
      t.references :housing, null: false, foreign_key: {on_delete: :cascade}
      t.references :food, null: false, foreign_key: {on_delete: :cascade}
      t.string :farm_name
      t.numeric :num_of_breeds
      t.datetime :start_date
      t.timestamps
    end
  end
end
