class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :points
      t.string :email
      t.string :password_digest
      t.string :user_name
      t.string :name
      t.string :surname
      t.integer :n_of_reports

      t.timestamps
    end
  end
end
