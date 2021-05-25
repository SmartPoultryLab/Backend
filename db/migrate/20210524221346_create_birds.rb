class CreateBirds < ActiveRecord::Migration[6.1]
  def change
    create_table :birds do |t|
      t.string :bird_name , null:false
      t.timestamps
    end
  end
end
