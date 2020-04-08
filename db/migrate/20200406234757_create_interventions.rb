class CreateInterventions < ActiveRecord::Migration[5.2]
  def up
    create_table :interventions do |t|
          t.references :author, foreign_key: { to_table: :employees }
          t.references :customer, foreign_key: true
          t.references :building, foreign_key: true
          t.references :column, foreign_key: true
          t.references :elevator, foreign_key: true
          t.references :employee, foreign_key: true
          t.datetime :start_datetime
          t.datetime :end_datetime
          t.string :result
          t.string :report
          t.string :status
    end
    end
  def down
    drop_table :interventions
  end
end
