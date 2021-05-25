class CreateFarmVaccinations < ActiveRecord::Migration[6.1]
  def change
    create_table :farm_vaccinations do |t|
      t.references :inspection, null: false, foreign_key: {on_delete: :cascade}
      t.references :vaccine,null:false,foreign_key:{on_delete: :cascade}
      t.numeric :quantity
      t.numeric :total_price
      t.datetime :start_date
      t.datetime :end_date
      t.text :notes
      t.timestamps
    end
  end
end
