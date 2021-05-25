class CreateVaccines < ActiveRecord::Migration[6.1]
  def change
    create_table :vaccines do |t|
      t.references(:vaccine_family,null:false)
      t.string :name
      t.numeric :unit_factor
      t.numeric :unit_price
      t.timestamps
    end
  end
end
