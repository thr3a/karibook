class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.string :id,null: false
      t.string :name,null: false

      t.timestamps null: false
    end
    execute "ALTER TABLE users ADD PRIMARY KEY (id);"
  end
end
