class CreateTeammates < ActiveRecord::Migration[5.2]
  def change
    create_table :teammates do |t|
      t.references :team
      t.string :firstname
      t.string :lastname
      t.string :email, unique: true
      t.integer :tel

      t.timestamps
    end
  end
end
