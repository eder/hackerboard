class AddCommentsCountToQuestion < ActiveRecord::Migration
  def up
    add_column :questions, :comments_count, :integer, :default => 0, :null => false
  end

  def down
    remove_column :questions, :comments_count
  end
end
