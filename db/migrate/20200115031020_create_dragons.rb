class CreateDragons < ActiveRecord::Migration[5.2]
  def change
    
    create_table :dragons do |t|
      t.datetime :remember_created_at
      t.belongs_to :user

      t.timestamps
    end


  end
end
