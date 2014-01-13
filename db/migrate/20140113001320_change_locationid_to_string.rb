class ChangeLocationidToString < ActiveRecord::Migration
  def change
    change_column :mailboxes, :location_id, :string
  end
end
