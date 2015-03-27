class AddLooksToLookbooks < ActiveRecord::Migration
  def change
    add_column :lookbooks, :look_2, :string
    add_column :lookbooks, :look_3, :string
    add_column :lookbooks, :look_4, :string
  end
end
