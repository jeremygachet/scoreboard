class AddUniqueIndexToValidation < ActiveRecord::Migration[5.2]
  def change
    add_index :validations, [:team_id, :exo_id], unique: true

  end
end
