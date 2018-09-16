class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :director
      t.string :runtime
      t.integer :year
      t.string :rating
      t.string :image

      t.timestamps
    end
  end
end
