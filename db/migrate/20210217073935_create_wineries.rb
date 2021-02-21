class CreateWineries < ActiveRecord::Migration[6.1]
  def change
    create_table :wineries do |t|
      t.string :name
      t.string :state
      t.string :country
      t.string :region
      t.integer :established

      t.timestamps
    end
  end
end
