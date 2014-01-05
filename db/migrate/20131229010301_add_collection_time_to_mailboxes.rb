class AddCollectionTimeToMailboxes < ActiveRecord::Migration
  def change
    add_column :mailboxes, :collection_time, :string
  end
end
