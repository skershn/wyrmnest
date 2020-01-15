class Clickcount < ActiveRecord::Migration[5.2]
  def change
    create_table :clickers do |t|
      t.integer :clicks, default: 0

      t.timestamps
    end
  end
end
