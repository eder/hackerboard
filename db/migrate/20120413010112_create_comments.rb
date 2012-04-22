class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :body, :null => false
      t.integer :user_id, :question_id, :null => false
    end

    add_index :comments, :user_id
    add_index :comments, :question_id
  end

  def down
    drop_table :comments
  end
end
