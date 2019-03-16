class RenameColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :book_title, :title
    rename_column :books, :book_body, :body
  end
end
