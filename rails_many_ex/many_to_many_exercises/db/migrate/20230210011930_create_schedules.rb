class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.belongs_to :course, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true
      t.datetime :enrollment_date

      t.timestamps
    end
  end
end
