class CreateAsignations < ActiveRecord::Migration[5.1]
  def change
    create_table :asignations do |t|
      t.belongs_to :service, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
