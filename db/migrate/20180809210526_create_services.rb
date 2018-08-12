class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :origin
      t.string :destination
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
