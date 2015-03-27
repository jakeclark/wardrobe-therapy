class AddStylistIdClientIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :stylist_id, :string
    add_column :books, :client_id, :string
  end
end
