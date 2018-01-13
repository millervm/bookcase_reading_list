class CreateBooks < ActiveRecord::Migration[5.1]
  def up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :to_read, :default => true
      t.integer :user_id
  end

  def down
    drop_table :books
  end

end
