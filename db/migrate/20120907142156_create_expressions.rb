class CreateExpressions < ActiveRecord::Migration
  def change
    create_table :expressions do |t|
      t.string :english
      t.string :portuguese
      t.integer :book
      t.integer :lesson
      t.string :pronounce
      t.boolean :revised

      t.timestamps
    end
  end
end
