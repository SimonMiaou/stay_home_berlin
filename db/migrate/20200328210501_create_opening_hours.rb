class CreateOpeningHours < ActiveRecord::Migration[6.0]
  def change
    create_table :opening_hours , id: :uuid do |t|
      t.uuid :business_id
      t.integer :day_number
      t.time :opening_time
      t.time :closing_time

      t.timestamps
    end
  end
end
