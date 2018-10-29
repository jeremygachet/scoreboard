class AddLinkToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :link, :string
  end
end
