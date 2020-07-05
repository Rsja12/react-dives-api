class CreateDivelogs < ActiveRecord::Migration[6.0]
  def change
    create_table :divelogs do |t|
      t.string :location
      t.string :divesite
      t.integer :max_depth
      t.integer :bottom_time
      t.integer :visibility
      t.integer :water_temp
      t.integer :weight
      t.string :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
