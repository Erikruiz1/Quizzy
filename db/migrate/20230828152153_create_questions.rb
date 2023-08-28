class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :game, null: false, foreign_key: true
      t.string :content
      t.string :answer

      t.timestamps
    end
  end
end
