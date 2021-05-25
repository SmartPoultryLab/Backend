class CreateDrugfamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :drugfamilies do |t|
      t.string :name
      t.timestamps
    end
  end
end
