class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :value, null: false, default: 0
      t.timestamps null: false
    end
  end
end
