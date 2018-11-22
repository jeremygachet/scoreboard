class AddCreatedByToValidations < ActiveRecord::Migration[5.2]
  def change
    add_column :validations, :created_by, :integer,null: true
    add_index :validations, :created_by
    add_foreign_key :validations, :users, column: :created_by
       
    add_column :validations, :updated_by, :integer, null: true
    add_index :validations, :updated_by
    add_foreign_key :validations, :users, column: :updated_by
  end
end
