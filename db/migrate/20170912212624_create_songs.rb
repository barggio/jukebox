class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :genre
      t.string :artist
      t.string :year

      t.timestamps
    end
  end
end
