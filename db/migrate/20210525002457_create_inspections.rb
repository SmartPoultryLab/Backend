class CreateInspections < ActiveRecord::Migration[6.1]
  def change
    create_table :inspections do |t|
      t.references(:user ,null: false, type: :bigint )
      t.references(:farm ,null: false, type: :bigint )
      t.datetime :inspection_date
      t.numeric :current_age
      t.numeric :dead_last_3_days
      t.numeric :feed_consumption
      t.numeric :water_consumption
      t.numeric :average_weight
      t.text :other_notes
      t.text :clinical_signs
      t.text :pm_lesions
      t.text :diagnoses
      t.timestamps
    end
  end
end
