class AddSizeFieldsToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :Height, :string
    add_column :user_details, :Dress_Pant_Size, :string
    add_column :user_details, :Jacket_Size, :string
    add_column :user_details, :Shoe_Size, :string
    add_column :user_details, :Bust, :string
    add_column :user_details, :Waist, :string
    add_column :user_details, :Hips, :string
  end
end
