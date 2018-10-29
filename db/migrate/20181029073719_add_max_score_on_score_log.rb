class AddMaxScoreOnScoreLog < ActiveRecord::Migration[5.2]
  def change
    add_column :score_logs, :max_score, :integer
  end
end
