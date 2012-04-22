class AddCategoryIdToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :category_id, :integer, :null => false, :default => 0
    add_index :questions, :category_id
  end

  def down
    remove_column :questions, :category_id
  end
end
