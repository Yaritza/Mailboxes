class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :address_searched
      t.belongs_to :mailbox, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
