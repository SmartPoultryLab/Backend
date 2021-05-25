class CreateHousings < ActiveRecord::Migration[6.1]
  def change
    create_table :housings do |t|
      t.string :housingName , null:false
      t.timestamps
    end
  end
end
