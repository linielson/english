class AddUserIdToExpression < ActiveRecord::Migration
  def change
    add_column :expressions, :user_id, :integer
    add_index :expressions, :user_id
  end
end
