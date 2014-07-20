class MakeHatesPolymorphic < ActiveRecord::Migration

  class Hate < ActiveRecord::Base
  end

  def change
    add_column :hates, :hateable_type, :string
    add_column :hates, :hateable_id, :integer, index: true
    add_index :hates, [:hateable_type, :hateable_id]

    Hate.all.each do |hate|
      hate.update!(hateable_type: "Hate", hateable_id: hate.image_id)
    end

    remove_column :hates, :image_id
  end
end
