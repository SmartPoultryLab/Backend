class CreateDrugs < ActiveRecord::Migration[6.1]
  def change
    create_table :drugs do |t|
      t.references(:drugfamily,null:false)
      t.string :drug_name
      t.numeric :unit_factor
      t.numeric :unit_price
      t.timestamps
    end
  end
end
