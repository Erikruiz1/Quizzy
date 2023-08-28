class CreateGameTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :game_topics do |t|
      t.references :game, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
