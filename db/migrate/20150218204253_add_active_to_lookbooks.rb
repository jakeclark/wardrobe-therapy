class AddActiveToLookbooks < ActiveRecord::Migration
  def change
    add_column :lookbooks, :active, :boolean
  end
end
