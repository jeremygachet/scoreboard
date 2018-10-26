class CreateExos < ActiveRecord::Migration[5.2]
  def change
    create_table :exos do |t|
      t.string :name, null: false
      t.text :comment
      t.integer :points, null: false
      t.integer :position

      t.timestamps
    end
  end
end
