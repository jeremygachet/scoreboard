class AddDefaultToTeamsScore < ActiveRecord::Migration[5.2]
  def change
    execute 'ALTER TABLE teams ALTER COLUMN total_score SET DEFAULT 0'
  end
end
