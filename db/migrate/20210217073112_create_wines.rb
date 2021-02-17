class CreateWines < ActiveRecord::Migration[6.1]
  def change
    create_table :wines do |t|
      t.references :winery_id, foreign_key: true
      t.references :user_id, foreign_key: true
      t.string :name
      t.string :wine_type
      t.integer :year

      t.timestamps
    end
  end
end
