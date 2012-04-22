class AddQuestionsCountToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :questions_count, :integer, :default => 0, :null => false
  end

  def down
    remove_column :categories, :questions_count
  end
end
