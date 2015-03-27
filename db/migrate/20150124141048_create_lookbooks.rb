class CreateLookbooks < ActiveRecord::Migration
  def change
    create_table :lookbooks do |t|
      t.references :user, index: true

      t.string :season
      t.string :category
      t.string :event
      t.string :description
      t.string :look
      t.string :year

      t.timestamps
    end
  end
end
