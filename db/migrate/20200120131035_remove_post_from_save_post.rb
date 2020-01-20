class RemovePostFromSavePost < ActiveRecord::Migration[6.0]
  def change
    remove_column :save_posts, :post, :text, array: true
  end
end
