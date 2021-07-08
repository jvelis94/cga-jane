class CreateJobHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :job_histories do |t|
      t.string :start_date
      t.string :end_date
      t.string :title
      t.references :company, null: false, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
