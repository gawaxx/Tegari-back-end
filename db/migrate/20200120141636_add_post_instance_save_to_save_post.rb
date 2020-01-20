class AddPostInstanceSaveToSavePost < ActiveRecord::Migration[6.0]
  def change
    add_column :save_posts, :post, :text, array: true
  end
end
