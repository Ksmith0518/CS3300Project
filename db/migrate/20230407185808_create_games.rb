class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :Title
      t.text :Description
      t.integer :Rating
      t.text :ReleaseDate
      t.integer :NumberOfPlayers

      t.timestamps
    end
  end
end
