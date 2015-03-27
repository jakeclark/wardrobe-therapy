class AddEmployerToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :employer, :string
  end
end
