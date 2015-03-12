class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :band_id, null: false

      t.timestamps null: false
    end
    add_foreign_key :albums, :bands
  end
end
