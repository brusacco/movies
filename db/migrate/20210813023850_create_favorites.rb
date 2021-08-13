class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
	
	add_index :favorites, :movie
    add_index :favorites, :user
	add_index :favorites, [:movie, :user], unique: true
  end
end
