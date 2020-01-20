class AddPostInstancesSaveToSavePost < ActiveRecord::Migration[6.0]
  def change
    add_column :save_posts, :post, :json, default: {}, null: false
  end
end

