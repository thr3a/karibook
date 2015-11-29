class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books, id: false do |t|
      t.string :isbn
      t.string :name
      t.string :author
      t.string :publisher
      t.string :published_date
      t.timestamps null: false
    end
    execute "ALTER TABLE books ADD PRIMARY KEY (isbn);"
  end
end
