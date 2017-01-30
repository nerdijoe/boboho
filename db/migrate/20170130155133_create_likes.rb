class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :total

      t.belongs_to :user, index: true
      t.belongs_to :listing, index: true

      t.timestamps null: false
    end
  end
end
