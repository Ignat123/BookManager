class Name1 < ActiveRecord::Migration

  def up
    add_column :users, :first_name, :string, :null => false, :default => "Name"
    add_column :users, :last_name, :string, :null => false, :default => "Surname"
  end

  def down
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end

end
