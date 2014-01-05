class AddCollectionDayToMailboxes < ActiveRecord::Migration
  def change
    add_column :mailboxes, :collection_day, :string
  end
end
