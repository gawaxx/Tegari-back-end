class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :category
      t.integer :price
      t.string :postcode
      t.string :address
      t.string :city
      t.string :description
      t.string :image_url
      t.string :condition

      t.timestamps
    end
  end
end
