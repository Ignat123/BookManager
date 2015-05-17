class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name,              null: false, default: ""
      t.string :source_url, null: false, default: ""
      t.timestamps null: false
    end
  end
end
