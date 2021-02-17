class CreateWineries < ActiveRecord::Migration[6.1]
  def change
    create_table :wineries do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :state
      t.integer :established

      t.timestamps
    end
  end
end
