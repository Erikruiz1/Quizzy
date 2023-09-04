class AddCompletedToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :completed, :boolean
  end
end
