class MakeLikesPolymorphic < ActiveRecord::Migration

  class Like < ActiveRecord::Base
  end

  def change
    add_column :likes, :content_type, :string
    add_column :likes, :content_id, :integer, index: true

    Like.all.each do |like|
      like.update!(content_type: "Image", content_id: like.image_id)
    end

    remove_column :likes, :image_id
  end
end
