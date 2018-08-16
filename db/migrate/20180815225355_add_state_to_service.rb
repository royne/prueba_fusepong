class AddStateToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :state, :integer
  end
end
