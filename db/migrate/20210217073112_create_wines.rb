class CreateWines < ActiveRecord::Migration[6.1]
  def change
    create_table :wines do |t|
      t.integer :winery, foreign_key: true
      t.integer :user, foreign_key: true
      t.string :name
      t.string :wine_type
      t.integer :year
      t.integer :price
      t.boolean :opened
      t.string :notes

      t.timestamps
    end
  end
end
