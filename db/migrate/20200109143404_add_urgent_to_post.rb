class AddUrgentToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :urgent, :boolean
  end
end
