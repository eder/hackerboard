class AddMagicFieldsToComments < ActiveRecord::Migration
  def up
    add_column :comments, :created_at, :datetime, :null => false
    add_column :comments, :updated_at, :datetime, :null => false
  end

  def down
    remove_column :comments, :created_at
    remove_column :comments, :updated_at
  end
end
