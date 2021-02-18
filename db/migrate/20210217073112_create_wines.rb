class CreateWines < ActiveRecord::Migration[6.1]
  def change
    create_table :wines do |t|
      t.references :winery, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.string :wine_type
      t.integer :year
      t.string :notes

      t.timestamps
    end
  end
end
