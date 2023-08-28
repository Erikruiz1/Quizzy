class CreateHints < ActiveRecord::Migration[7.0]
  def change
    create_table :hints do |t|
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
