class AddMessageToService < ActiveRecord::Migration[5.1]
  def change
    add_reference :services, :message, foreign_key: true
  end
end
