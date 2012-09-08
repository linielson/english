class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :expression
      t.string :answer
      t.string :language_answer
      t.boolean :correct_answer

      t.timestamps
    end
    add_index :exercises, :expression_id
  end
end
