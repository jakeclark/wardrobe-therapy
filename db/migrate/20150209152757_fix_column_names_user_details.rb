class FixColumnNamesUserDetails < ActiveRecord::Migration
  def change
    rename_column :user_details, :Height, :height
    rename_column :user_details, :Dress_Pant_Size, :dress_pant_size
    rename_column :user_details, :Jacket_Size, :jacket_size
    rename_column :user_details, :Shoe_Size, :shoe_size
    rename_column :user_details, :Bust, :bust
    rename_column :user_details, :Waist, :waist
    rename_column :user_details, :Hips, :hips
  end
end
