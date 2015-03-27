class AddMoreInfoToUserDetails < ActiveRecord::Migration
  def change
    add_column :user_details, :address_1, :string
    add_column :user_details, :address_2, :string
    add_column :user_details, :address_3, :string
    add_column :user_details, :city, :string
    add_column :user_details, :state, :string
    add_column :user_details, :county, :string
    add_column :user_details, :zip_code, :string
    add_column :user_details, :country, :string
    add_column :user_details, :day_time_phone, :string
    add_column :user_details, :mobile_phone, :string
    add_column :user_details, :email, :string
    add_column :user_details, :dob, :string
    add_column :user_details, :gender, :string
  end
end
