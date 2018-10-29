class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.boolean :published
      t.datetime :published_datetime

      t.timestamps
    end
  end
end
