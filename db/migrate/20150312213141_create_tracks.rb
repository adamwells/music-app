class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false

      t.timestamps null: false
    end
    add_foreign_key :tracks, :albums
  end
end
