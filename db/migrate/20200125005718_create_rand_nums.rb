class CreateRandNums < ActiveRecord::Migration[5.2]
  def change
    create_table :rand_nums do |t|

      t.timestamps
    end
  end
end
