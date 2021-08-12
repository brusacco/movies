class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :uid
      t.float :popularity
      t.boolean :adult

      t.timestamps
    end
    add_index :movies, :uid
    add_index :movies, :adult
  end
end
