class AddElaborateToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :elaborate, :string
  end
end
