class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.references :user, index: true

      t.string :measurements
      t.string :favourite_designer

      t.timestamps
    end
  end
end
