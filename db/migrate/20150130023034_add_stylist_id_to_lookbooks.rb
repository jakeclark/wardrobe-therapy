class AddStylistIdToLookbooks < ActiveRecord::Migration
  def change
    add_column :lookbooks, :stylist_id, :string
  end
end
