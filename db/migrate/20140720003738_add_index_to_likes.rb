class AddIndexToLikes < ActiveRecord::Migration
  def change
    add_index :likes, [:content_type, :content_id]
  end
end
