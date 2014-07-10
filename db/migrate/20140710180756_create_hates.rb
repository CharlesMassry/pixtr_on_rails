class CreateHates < ActiveRecord::Migration
  def change
    create_table :hates do |t|
      t.belongs_to :image, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
