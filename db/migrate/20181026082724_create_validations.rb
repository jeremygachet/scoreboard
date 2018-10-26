class CreateValidations < ActiveRecord::Migration[5.2]
  def change
    create_table :validations do |t|
      t.references :team, null: false
      t.references :exo, null: false

      t.timestamps
    end
  end
end
