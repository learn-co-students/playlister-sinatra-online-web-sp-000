class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :slug
      t.belongs_to :artist
      t.belongs_to :song
    end
      
  end
end
