class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :user_reported_id
      t.integer :user_reporting_id
      t.string :reason_reporting
      t.integer :post_id_reported

      t.timestamps
    end
  end
end
