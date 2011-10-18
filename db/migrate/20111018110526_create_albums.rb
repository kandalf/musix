class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :artist
      t.string :year

      t.timestamps
    end

    add_index :albums, :name
    add_index :albums, :artist
  end
end
