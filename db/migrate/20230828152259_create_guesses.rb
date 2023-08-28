class CreateGuesses < ActiveRecord::Migration[7.0]
  def change
    create_table :guesses do |t|
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
