class CreateDragons < ActiveRecord::Migration[5.2]
  def change
    create_table :dragon_types do |t|
      t.string :description
      t.integer :rarity
    end

    create_table :dragons do |t|
      t.references :user, foreign_key: true
      t.datetime :remember_created_at
      t.belongs_to :user
      t.belongs_to :dragon_type

      t.timestamps
    end


  end
end
