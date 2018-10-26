class AddTotalScoreToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :total_score, :integer, index: true
  end
end
