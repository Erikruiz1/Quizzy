class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :difficulty
      t.integer :number_of_questions
      t.string :response

      t.timestamps
    end
  end
end
