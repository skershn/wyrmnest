class CreateDragons < ActiveRecord::Migration[5.2]
  def change
    create_table :dragons do |t|
      t.references :user, foreign_key: true
      t.datetime :remember_created_at
      t.integer :user_id

      t.timestamps
    end
  end
end
