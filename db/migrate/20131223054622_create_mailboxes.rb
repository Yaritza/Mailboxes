class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.string :address
      t.string :city
      t.integer :zip
      t.integer :location_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
