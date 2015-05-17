class AddToLikeLink < ActiveRecord::Migration
  def change
    change_table :likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :song, index: true
    end
  end
end
