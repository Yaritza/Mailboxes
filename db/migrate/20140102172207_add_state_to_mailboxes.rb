class AddStateToMailboxes < ActiveRecord::Migration
  def change
    add_column :mailboxes, :state, :string
  end
end
