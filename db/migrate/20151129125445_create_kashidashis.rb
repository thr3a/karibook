class CreateKashidashis < ActiveRecord::Migration
  def change
    create_table :kashidashis do |t|
      t.string :isbn
      t.string :user_id

      t.timestamps null: false
    end
  end
end
