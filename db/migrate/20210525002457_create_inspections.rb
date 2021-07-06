class CreateInspections < ActiveRecord::Migration[6.1]
  def change
    create_table :inspections do |t|
      t.references(:user ,null: false, type: :bigint )
      t.references(:farm ,null: false, type: :bigint )
      t.datetime :inspection_date
      t.text :current_age
      t.numeric :dead_last_3_days
      t.text :feed_consumption
      t.text :water_consumption
      t.text :average_weight
      t.text :other_notes
      t.text :clinical_signs
      t.text :pm_lesions
      t.text :diagnoses
      t.timestamps
    end
  end
end
