class Name < ActiveRecord::Migration

  def up
    add_column :users, :firstName, :string, :null => false, :default => "Name"
    add_column :users, :lastName, :string, :null => false, :default => "Surname"
  end

  def down
    remove_column :users, :firstName, :string
    remove_column :users, :lastName, :string
  end

end
