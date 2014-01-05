class AddCollectionHoursToMailboxes < ActiveRecord::Migration
  def change
    add_column :mailboxes, :collection_hours, :text
  end
end
