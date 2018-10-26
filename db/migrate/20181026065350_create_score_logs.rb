class CreateScoreLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :score_logs do |t|
      t.string :name
      t.text :comment
      t.json :score
      t.boolean :published

      t.timestamps
    end
  end
end
