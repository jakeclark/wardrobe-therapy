class CreateBooksLookbooks < ActiveRecord::Migration
  def change
    create_table :books_lookbooks, id: false do |t|
      t.integer :lookbook_id
      t.integer :book_id
    end
  end
end
